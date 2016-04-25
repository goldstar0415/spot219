module PlacesHelper

  def resource_name
    :city
  end
 
  def resource
    @resource ||= City.new
  end
 
  
end
