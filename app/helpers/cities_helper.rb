module CitiesHelper
  def resource_name
    :place
  end
 
  def resource
    @resource ||= Place.new
  end
end
