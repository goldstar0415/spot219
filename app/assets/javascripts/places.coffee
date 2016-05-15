# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@marker = undefined
updateLocation = (location) ->
  if @marker
    @marker.setPosition location
  else
    @marker = new (google.maps.Marker)(
      position: location
      map: gMapObj)

  jQuery('#place_latitude').val location.lat()
  jQuery('#place_longitude').val location.lng()
  return

set_fields_values = (position) ->
  initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
  gMapObj.setCenter(initialLocation)
  updateLocation(initialLocation)

show_manual_location_fields = ->
  return

set_location_fields = ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition( set_fields_values )
  else
    show_manual_location_fields()

loadLocationBasedOnAddress=->
  address = $('#place_address').val()
  city = $('#place_city_id').val()
  country = $('#place_country').val()
  full_address = "#{address}, #{city}, #{country}"

  codeAddress(full_address)

codeAddress =(address) ->
  geocoder = new google.maps.Geocoder();
  geocoder.geocode { 'address': address }, (results, status) ->
    if status == google.maps.GeocoderStatus.OK
      location = results[0].geometry.location
      gMapObj.setCenter location
      if @marker
        @marker.setPosition location
      else
        @marker = new (google.maps.Marker)(
          position: location
          map: gMapObj)
    else
      alert 'Geocode was not successful for the following reason: ' + status
    return
  return

@loadCurrentLocation=->
  set_location_fields()
  $('#place_address').change ->
    loadLocationBasedOnAddress()

