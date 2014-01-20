json.array!(@sections) do |section|
  json.extract! section, :id, :name, :number, :body, :creative_id
  json.url section_url(section, format: :json)
end
