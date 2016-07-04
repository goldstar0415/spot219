//= require jquery2
//= require jquery_ujs
//= require bxslider
//= require bootstrap-sprockets
//= require bootstrap
//= require functions
//= require main
//= require places
//= require jquery.raty
//= require ratyrate
//= require ckeditor/init
//= require cocoon
//= require highcharts
//= require chartkick
//= require shopping_carts
//= require jquery-ui/autocomplete

show_spinner = ->
  $('#spinner').show()

hide_spinner = ->
  $('#spinner').hide()


$(document).ready ->
  $('.bxslider').bxSlider
    auto: true,
    autoControls: true

  $searchfield = $('#search')
  $searchfield.autocomplete
    source: $searchfield.data('url')
      # $.ajax
      #   url: 'http://gd.geobytes.com/AutoCompleteCity'
      #   dataType: "jsonp"
      #   data:
      #     q: req.term
      #   success: (data) ->
      #     resp data.responseText
