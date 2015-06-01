json.array!(@technologies) do |technology|
  json.extract! technology, :id, :name, :rate
  json.url technology_url(technology, format: :json)
end
