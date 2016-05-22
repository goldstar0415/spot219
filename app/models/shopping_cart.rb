class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  def paypal_url(return_url)
    values = {
      :business => ENV['Paypal_Business'],
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    shopping_cart_items.each_with_index do |cart, index|
      values.merge!({
        "amount_#{index+1}" => cart.price,
        "item_name_#{index+1}" => cart.item.name,
        "item_number_#{index+1}" => cart.id,
        "quantity_#{index+1}" => cart.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
