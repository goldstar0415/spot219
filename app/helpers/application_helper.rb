module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def active_class?(*paths)
    active = false
    paths.each { |path| active ||= current_page?(path) }
    active ? 'active' : nil
  end
end
