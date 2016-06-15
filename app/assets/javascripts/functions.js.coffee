@getLocation = ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition redirectToCity
  else
    alert('Geolocation is not supported by this browser.')
  return

redirectToCity = (position) ->
  $.post '/cities/location', position.coords, (data)->
    if data.first_time && data.subdomain
      location.href = "/cities/#{data.subdomain}"
  return

@redirectToCityWithNoLocation=(lat, long)  ->
  $.post '/cities/location', {latitude: lat, longitude: long}, (data)->
    if data.first_time && data.subdomain
      location.href = "/cities/#{data.subdomain}"
  return

$(document).ajaxSend (e, xhr, options) ->
  token = $('meta[name=\'csrf-token\']').attr('content')
  xhr.setRequestHeader 'X-CSRF-Token', token
  return