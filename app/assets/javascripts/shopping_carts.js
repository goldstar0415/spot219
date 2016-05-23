function checkAddress(checkbox)
{
    if (checkbox.checked)
    {
      $("#delivery-address").removeClass('hide');
    }
    else{
      $("#delivery-address").addClass('hide');
    }
}

