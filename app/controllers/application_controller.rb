class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def has_role?(*args)
    #current_roles.include?(role.to_s)
    args.any? { |x| current_roles.include?(x.to_s) }
  end
  helper_method :has_role?

  def current_roles
    return [] unless current_user
    @current_roles ||= current_user.roles.pluck(:name)
  end

  private
    def current_order
      @current_order ||= begin
        if has_order?
          @current_order
        else
          order = Shoppe::Order.create(:ip_address => request.ip)
          session[:order_id] = order.id
          order
        end
      end
    end

    def has_order?
      !!(
        session[:order_id] &&
        @current_order = Shoppe::Order.includes(:order_items => :ordered_item).find_by_id(session[:order_id])
      )
    end

    helper_method :current_order, :has_order?

    def has_feature?(user, slug)
      current_features(user).to_a.include?(slug)
    end

    def current_features(user)
      return [] unless user
      @current_features ||= user.subscription.try(:features).try(:pluck, :slug)
    end
    helper_method :has_feature?
end
