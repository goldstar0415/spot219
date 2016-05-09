class City < ActiveRecord::Base
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { minimum: 10 }
  validates :about, presence: true
  validates :city_name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }

  validates_presence_of :latitude, :longitude, :radius
  reverse_geocoded_by :latitude, :longitude

  def countPlace
    @places = Place.all
    c = 0
    @places.each do |place|
      if self.city_name == place.city
        c+=1
      else
        c=c
      end
    end
    return c
  end

  def self.search lat, long
    cities = []
    City.find_each do |city|
      in_radius_ids = City.near([lat, long], city.radius, :units => :km).map(&:id)
      cities << city if in_radius_ids.include?(city.id)
    end

    cities
  end
end
