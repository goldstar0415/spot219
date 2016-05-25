class ShoppingCartItem < ActiveRecord::Base
  #acts_as_shopping_cart_item

  def tax
    (price * 10)/100
  end

  def sub_total
    price + tax
  end
end
