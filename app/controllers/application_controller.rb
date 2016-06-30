class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :get_user_location
  after_action :debugger

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end


  #
  #
  def get_user_location
    if session[:user_city].blank?
      # user_ip = request.remote_ip
      user_ip = (Rails.env.development? ? '199.103.62.197' : request.remote_ip)
      user_geocoded_location = Geokit::Geocoders::MultiGeocoder.geocode(user_ip)

      if user_geocoded_location.success?
        city = City.find_by(name: user_geocoded_location.city)

        if city.present?
          session[:user_city] = city.name
        end
      end
    end
  end

  #
  #
  def debugger
    if Rails.env.development?
      ap session
    end
  end


  #
  #
  def has_role?(*args)
    #current_roles.include?(role.to_s)
    args.any? { |x| current_roles.include?(x.to_s) }
  end
  helper_method :has_role?


  #
  #
  def current_roles
    return [] unless current_user
    @current_roles ||= current_user.roles.pluck(:name)
  end


  protected
    #
    #
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


    #
    #
    def has_order?
      !!(
        session[:order_id] &&
        @current_order = Shoppe::Order.includes(order_items: :ordered_item).find_by_id(session[:order_id])
      )
    end
    helper_method :current_order, :has_order?


    #
    #
    def has_feature?(user, slug)
      current_features(user).to_a.include?(slug)
    end


    #
    #
    def current_features(user)
      return [] unless user
      @current_features ||= user.subscription.try(:features).try(:pluck, :slug)
    end
    helper_method :has_feature?
end
