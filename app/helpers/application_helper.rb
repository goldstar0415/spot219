module ApplicationHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)


  #
  #
  def show_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type)

      tag_class = options.extract!(:class)[:class]
      tag_options = {
        class: "alert fade in alert-#{type} #{tag_class}"
      }.merge(options)

      close_button = content_tag(:button, raw("&times;"), type: "button", class: "close", "data-dismiss" => "alert")

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg, tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end


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
    args.any? { |x| current_roles.include?(x.to_s) }
  end


  #
  #
  def current_roles
    return [] unless current_user
    @current_roles ||= current_user.roles.pluck(:name)
  end


  #
  #
  def redirect_with_permission_error error_message=nil, redirect_to_path=nil
    flash[:danger] = (error_message || "You don't have permission to perform the action.")
    redirect_to(redirect_to_path || root_path)
  end
end
