class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  helper_method :current_user, :page, :per_page

  private
  def require_login
    if current_user.blank?
      render json: {status: 401, msg: "请先登录"}, status: 401
    end
  end

  def verifier
    @verifier ||= ActiveSupport::MessageVerifier.new(Rails.application.secrets[:secret_key_base], digest: 'SHA256')
  end

  def current_user
    token = params[:token] || request.headers['Authorization']
    user = User.find(verifier.verify(token))
  rescue=>e
    Rails.logger.error e.message
    Rails.logger.error $@
    render json: {msg: e.message, code: -1}
  end

  def page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 20).to_i
  end
end
