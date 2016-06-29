# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  about      :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  lng        :float
#  lat        :float
#  radius     :float
#  image      :string
#  slug       :string
#  distance   :float
#  country_id :integer
#

class City < ActiveRecord::Base
  # plugins
  #
  extend FriendlyId
  friendly_id :name
  # acts_as_mappable auto_geocode: { field: :name, error_message: 'Could not geocode city'}
  mount_uploader :image, ImageUploader


  # relations
  #
  belongs_to :country
  has_many :places, dependent: :destroy
  has_many :blogs
  belongs_to :user
  has_many :users


  # callbacks
  #
  before_validation :geocode_address


  # validations
  #
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }


  def countPlace
    places.count
  end


  def categories
    c = []
    places.each do |place|
      c |= place.categories
    end

    return c
  end


  def self.search lat, long
    cities = []
    City.find_each do |city|
      in_radius_ids = City.near([lat, long], city.radius, units: :km).map(&:id)
      cities << city if in_radius_ids.include?(city.id)
    end

    cities
  end


  def geocode_address
    if lat.nil? || lng.nil?
      geo = Geokit::Geocoders::MultiGeocoder.geocode ("#{name}, #{country.name}")
      # errors.add(:address, "Could not Geocode address") if !geo.success
      self.lat, self.lng = 0, 0 if !geo.success
      self.lat, self.lng = geo.lat, geo.lng if geo.success
    end
  end


  def should_generate_new_friendly_id?
    slug.blank?
  end
end
