json.array!(@sections) do |section|
  json.extract! section, :id, :name, :number, :body, :creative_id
  json.url section_url(creative_section, format: :json)
end
