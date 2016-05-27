json.array!(@sliders) do |slider|
  json.extract! slider, :id, :name, :user_id, :image, :position
  json.url slider_url(slider, format: :json)
end
