json.array!(@user_technologies) do |user_technology|
  json.extract! user_technology, :id, :user_id, :technology_id, :technology_type, :expertise
  json.url user_technology_url(user_technology, format: :json)
end
