json.array!(@comments) do |comment|
  json.extract! comment, :id, :title, :description
  json.url comment_url(comment, format: :json)
end
