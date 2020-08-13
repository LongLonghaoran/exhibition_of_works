class WorksController < ApplicationController
  before_action :require_login
  before_action :find_work, only: [:show, :update]

  def index
    @q = Work.ransack(params[:q])
    @works = @q.result.offset((page-1)*per_page).limit(per_page)
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      render json: {code: 0, msg: "上传成功", work: @work.attributes}
    else
      render json: {code: -1, msg: "创建失败:#{@work.errors.full_messages.join(',')}"}
    end
  end

  def update
    if @work.update(work_params)
      render json: {code: 0, msg: "更新成功", work: @work.attributes}
    else
      render json: {code: -1, msg: "更新失败:#{@work.errors.full_messages.join(',')}"}
    end
  end

  def show
  end

  private
  def work_params
    params.require(:work).permit(
      :name, :enroll_year, :major, :category, :client_type, :attachment, student_names: []
    )
  end

  def find_work
    @work = Work.find(params[:id])
  end
end
