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
end
