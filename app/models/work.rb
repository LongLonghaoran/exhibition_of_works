class Work < ApplicationRecord
  validates :enroll_year, inclusion: { in: 2014..2030}
  validates :name, presence: :true
  validate :correct_document_mime_type

  
  # 专业
  enum major: {
    computer_science: 0, 
    soft_engineer: 1, 
    electronic_infomation_engineer: 2, 
    information_management: 3, 
    engineer_management: 4, 
    internet_of_thing: 5, 
    intelligent_science: 6, 
    artificial_intelligence: 7
  }
  # 类别
  enum category: {social: 0, manager: 1, tool: 2, study: 3, other: 4}
  # 端
  enum client_type: {mobile: 0, web: 1}
  # 学生姓名数组
  serialize :student_names, Array

  has_one_attached :attachment

  private
  def correct_document_mime_type
    if attachment.attached? && !attachment.content_type.in?(%w(application/vnd.ms-powerpoint application/vnd.openxmlformats-officedocument.presentationml.presentation video/mp4))
      errors.add(:attachment, '只支持ppt和mp4格式')
    end
  end
end