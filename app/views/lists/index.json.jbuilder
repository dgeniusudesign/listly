json.array!(@lists) do |list|
  json.extract! list, :id, :name, :items_count, :user_id
  json.url list_url(list, format: :json)
end
