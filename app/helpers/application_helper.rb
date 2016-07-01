module ApplicationHelper
  #
  #
  def resource_name
    :user
  end


  #
  #
  def resource
    @resource ||= User.new
  end


  #
  #
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  #
  #
  def active_class?(*paths)
    active = false
    paths.each { |path| active ||= current_page?(path) }
    active ? 'active' : nil
  end


  #
  #
  def manageable_cities_by user
    if user.has_role? :admin
      City.all
    elsif user.has_role? :mayor
      City.with_role :mayor, user
    end
  end


  #
  #
  def has_role?(*args)
    #current_roles.include?(role.to_s)
    args.any? { |x| current_roles.include?(x.to_s) }
  end


  #
  #
  def current_roles
    return [] unless current_user
    @current_roles ||= current_user.roles.pluck(:name)
  end
end
