json.array!(@teachers) do |teacher|
  json.extract! teacher, :email
  json.url teacher_url(teacher, format: :json)
end
