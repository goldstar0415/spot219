@getLocation = ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition redirectToCity
  else
    x.innerHTML = 'Geolocation is not supported by this browser.'
  return

redirectToCity = (position) ->
  $.post '/cities/location', position.coords, (data)->
    if data.first_time
      location.href = "/cities/#{data.id}"
  return