# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  about      :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lng        :float
#  lat        :float
#  radius     :float
#  image      :string
#  slug       :string
#  distance   :float
#  country    :string
#  creator_id :integer
#

class City < ActiveRecord::Base
  # plugins
  #
  resourcify
  searchkick
  extend FriendlyId
  friendly_id :slug_candidates
  # acts_as_mappable auto_geocode: { field: :name, error_message: 'Could not geocode city'}
  mount_uploader :image, ImageUploader


  # relations
  #
  has_many :places, dependent: :destroy
  has_many :blogs
  belongs_to :creator, class_name: 'User'
  has_many :users


  # callbacks
  #
  before_validation :geocode_address


  # validations
  #
  validates_presence_of :name, :country, :about
  validates_uniqueness_of :name, case_sensitive: false, scope: [:country]


  # callbacks
  #
  after_save do |rec|
    # Rolify had issue with this
    mayors = User.with_role(:mayor, rec).distinct.select { |u| u.has_role?(:mayor, rec) }
    mayors.each { |mayor| mayor.revoke :mayor, rec }
    rec.creator.add_role :mayor, rec
  end


  #
  #
  def countPlace
    places.count
  end


  #
  #
  def categories
    c = []
    places.each do |place|
      c |= place.categories
    end

    return c
  end


  # def self.search lat, long
  #   cities = []
  #   City.find_each do |city|
  #     in_radius_ids = City.near([lat, long], city.radius, units: :km).map(&:id)
  #     cities << city if in_radius_ids.include?(city.id)
  #   end

  #   cities
  # end


  #
  #
  def geocode_address
    if lat.nil? || lng.nil?
      geo = Geokit::Geocoders::MultiGeocoder.geocode("#{name}, #{country}")
      # errors.add(:address, "Could not Geocode address") if !geo.success
      self.lat, self.lng = 0, 0 if !geo.success
      self.lat, self.lng = geo.lat, geo.lng if geo.success
    end
  end


  #
  #
  def should_generate_new_friendly_id?
    slug.blank?
  end


  #
  #
  def search_data
    {
      name: name
    }
  end


  #
  #
  def slug_candidates
    [
      :name,
      [:name, :country]
    ]
  end
end
