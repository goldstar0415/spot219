# == Schema Information
#
# Table name: cities
#
#  id                 :integer          not null, primary key
#  about              :text
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  lng                :float
#  lat                :float
#  radius             :float
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  slug               :string
#  distance           :float
#  country_id         :integer
#

class City < ActiveRecord::Base
  # plugins
  #
  extend FriendlyId
  friendly_id :name
  # reverse_geocoded_by :latitude, :longitude
  # has_attached_file :image, styles: { medium: "640x426>", thumb: "200x134#" }
  acts_as_mappable auto_geocode: { field: :name, error_message: 'Could not geocode city'}


  # relations
  #
  belongs_to :country
  has_many :places, dependent: :destroy
  has_many :blogs
  belongs_to :user
  has_many :users


  # validations
  #
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true, length: { minimum: 10 }
  # validates :about, presence: true
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
  # validates :subdomain, presence: true, uniqueness: true
  # validates_presence_of :latitude, :longitude, :radius
  # validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
  # validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


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
      in_radius_ids = City.near([lat, long], city.radius, :units => :km).map(&:id)
      cities << city if in_radius_ids.include?(city.id)
    end

    cities
  end
end
