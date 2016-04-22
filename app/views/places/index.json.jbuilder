json.array!(@places) do |place|
  json.extract! place, :id, :name, :about, :country, :city, :address, :phone, :fb, :twit, :insta, :web
  json.url place_url(place, format: :json)
end
