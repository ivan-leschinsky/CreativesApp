json.array!(@creatives) do |creative|
  json.extract! creative, :id, :name, :description
  json.url creative_url(creative, format: :json)
end
