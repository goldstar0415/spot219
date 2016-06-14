json.array!(@compaigns) do |compaign|
  json.extract! compaign, :id
  json.url compaign_url(compaign, format: :json)
end
