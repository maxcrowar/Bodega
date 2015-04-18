json.array!(@works) do |work|
  json.extract! work, :id, :title, :description
  json.url work_url(work, format: :json)
end
