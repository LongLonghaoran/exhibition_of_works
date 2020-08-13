json.extract!(@work, :id, :name, :major, :enroll_year, :client_type, :category, :student_names)
json.attachment_url url_for(@work.attachment) if @work.attachment.attached?