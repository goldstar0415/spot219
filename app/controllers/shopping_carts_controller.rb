class ShoppingCartsController < InheritedResources::Base
  before_filter :extract_shopping_cart

  def index
    if @shopping_cart.blank?
      Place.limit(2).each do |place|
        @shopping_cart.add(place, place.price)
      end
    end
    if user_signed_in?
      @order_info = current_user.order_info
      @billing_address = current_user.billing_address
      @delivery_address = current_user.delivery_address
    else
      @order_info = OrderInfo.new
      @billing_address = BillingAddress.new
      @delivery_address = DeliveryAddress.new
    end
  end

  def create
    @place = Place.find(params[:place_id])
    @shopping_cart.add(@place, @place.price) #price
    redirect_to shopping_carts_path
  end

  def remove_item
    @place = Place.find(params[:id])
    @shopping_cart.remove(@place, 1) #quality
    redirect_to shopping_carts_path
  end

  def paypal_callback
    @shopping_cart.clear
    flash[:notice] = "Your Payment was successful"
    redirect_to root_path
  end

  def checkout
    if @shopping_cart.present?
      order_info = current_user.order_info if user_signed_in?
      order_info ||= OrderInfo.new
      order_info.assign_attributes(order_info_params)
      order_info.user = current_user if user_signed_in? #set user in first time checkout
      order_info.save

      billing_address = current_user.billing_address if user_signed_in?
      billing_address ||= BillingAddress.new
      billing_address.assign_attributes(billing_address_params)
      billing_address.user = current_user if user_signed_in?
      billing_address.save

      if billing_address.add_delivery == "1"
        delivery_address = current_user.delivery_address if user_signed_in?
        delivery_address ||= DeliveryAddress.new
        delivery_address.assign_attributes(delivery_address_params)
        delivery_address.user = current_user if user_signed_in?
        delivery_address.save
      end

      order = Order.new
      order.user = current_user if user_signed_in?
      order.total_excluding_tax = @shopping_cart.subtotal
      order.total_price = @shopping_cart.total
      order.tax = @shopping_cart.taxes
      order.order_info = order_info
      order.billing_address = billing_address
      order.delivery_address = delivery_address if delivery_address.present?
      order.save
      @shopping_cart.shopping_cart_items.each do |item|
        order_detail = order.order_details.new
        order_detail.place_id = item.item.id
        order_detail.quantiy = item.quantity
        order_detail.price = item.price
        order_detail.tax = item.tax
        order_detail.sub_total = item.sub_total
        order_detail.save
      end
    end
    redirect_to @shopping_cart.paypal_url(paypal_callback_shopping_carts_url)
    #redirect_to root_path
  end

  private

    def shopping_cart_params
      params.require(:shopping_cart).permit()
    end

    def extract_shopping_cart
      shopping_cart_id = session[:shopping_cart_id]
      @shopping_cart = ShoppingCart.find_by_id(shopping_cart_id)  if shopping_cart_id.present?
      @shopping_cart ||= ShoppingCart.create
      session[:shopping_cart_id] = @shopping_cart.id
    end
    def order_info_params
      params.require(:order_info).permit(:first_name, :last_name, :company, :email, :phone)
    end

    def billing_address_params
      params.require(:billing_address).permit(:line, :city, :country, :postcode, :country_code, :add_delivery)
    end

    def delivery_address_params
      params.require(:delivery_address).permit(:name, :line, :city, :country, :postcode, :country_code)
    end
end

