# == Schema Information
#
# Table name: places
#
#  id                :integer          not null, primary key
#  name              :string
#  about             :text
#  address           :string
#  phone             :string
#  facebook          :string
#  twitter           :string
#  instagram         :string
#  web               :string
#  created_at        :datetime
#  updated_at        :datetime
#  owner_id          :integer
#  city_id           :integer
#  lat               :float
#  lng               :float
#  tagline           :string
#  slug              :string
#  featured          :boolean          default(FALSE)
#  image             :string
#  impressions_count :integer          default(0)
#

class Place < ActiveRecord::Base
  # plugins
  #
  resourcify
  searchkick
  extend FriendlyId
  friendly_id :slug_candidates
  is_impressionable counter_cache: true
  mount_uploader :image, ImageUploader
  # acts_as_mappable auto_geocode: { field: :address, error_message: 'Could not geocode city'}


  # relations
  #
  belongs_to :owner, class_name: 'User'
  belongs_to :city
  has_many :place_categories, dependent: :destroy
  has_many :categories, through: :place_categories
  has_many :comments, as: :commentable, dependent: :destroy
  # has_many :open_days, dependent: :destroy
  has_many :sliders, dependent: :destroy
  has_one :campaign
  has_one :business_hour


  # validations
  #
  validates_presence_of :name, :about, :address, :city, :phone, :owner, :facebook, :twitter, :instagram, :web, :image
  before_validation :geocode_address


  # nested attributes
  #
  # accepts_nested_attributes_for :open_days, reject_if: :not_open, allow_destroy: true
  accepts_nested_attributes_for :business_hour
  accepts_nested_attributes_for :sliders, reject_if: :all_blank, allow_destroy: true


  # scopes
  #
  scope :featured, -> {
    where(featured: :true).order("RANDOM()").limit(12)
  }


  # callbacks
  #
  before_validation :strip_links


  def search_data
    {
      name: name,
      about: about,
      city: city.try(:name),
      categories: categories.map(&:name)
    }
  end


  def average_rating
    if self.comments.size > 0
      self.comments.average(:number).round(1)
    else
      0
    end
  end


  def rating_count
    if self.comments.size > 0
      self.comments.size
    else
      0
    end
  end


  def add_business_hour
    if !self.business_hour.present?
      # Enum::Place::DAY_NAME[:options].each do |day|
      self.build_business_hour
      # end
    end
  end


  def price
    5
  end


  def geocode_address
    if lat.nil? || lng.nil?
      geo = Geokit::Geocoders::MultiGeocoder.geocode ("#{address}, #{city.name}")
      # errors.add(:address, "Could not Geocode address") if !geo.success
      self.lat, self.lng = 0, 0 if !geo.success
      self.lat, self.lng = geo.lat, geo.lng if geo.success
    end
  end


  def should_generate_new_friendly_id?
    slug.blank?
  end


  #
  #
  def strip_links
    self.facebook = (Addressable::URI.parse(facebook).path.split('/')[1] || facebook) if !facebook.blank?
    self.twitter = (Addressable::URI.parse(twitter).path.split('/')[1] || twitter) if !twitter.blank?
    self.instagram = (Addressable::URI.parse(instagram).path.split('/')[1] || instagram) if !instagram.blank?
  end


  #
  #
  def slug_candidates
    unless city.blank?
      [
        :name,
        [:name, city.name],
        [:name, city.name, city.country]
      ]
    else
      [:name]
    end
  end
end
