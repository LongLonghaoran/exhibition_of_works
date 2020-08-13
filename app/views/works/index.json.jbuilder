json.code 0
json.works @works do |work|
  json.extract!(work, :id, :name, :major, :enroll_year, :client_type, :category, :student_names)
  json.attachment_url url_for(work.attachment) if work.attachment.attached?
end
json.total_count @works.unscope(:limit, :offset)
json.page page
json.per_page per_page