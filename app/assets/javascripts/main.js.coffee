$(document).ready ->
  $('.auto-submit').change ->
    $(this).closest('form').submit()