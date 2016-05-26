json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :name, :price, :package
  json.url subscription_url(subscription, format: :json)
end
