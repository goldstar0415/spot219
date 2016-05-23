class ShoppingCartsController < InheritedResources::Base
  before_filter :extract_shopping_cart

  def create
    @place = Place.find(params[:place_id])
    @shopping_cart.add(@place, 1) #price
    redirect_to shopping_carts_path
  end

  def remove_item
    @place = Place.find(params[:id])
    @shopping_cart.remove(@place, 1)
    redirect_to shopping_carts_path
  end

  def paypal_callback
    @shopping_cart.clear
    flash[:notice] = "Your Payment was successful"
    redirect_to root_path
  end

  private

    def shopping_cart_params
      params.require(:shopping_cart).permit()
    end

    def extract_shopping_cart
      shopping_cart_id = session[:shopping_cart_id]
      @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
      session[:shopping_cart_id] = @shopping_cart.id
    end
end

