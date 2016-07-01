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
#  user_id           :integer
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
  belongs_to :user
  has_many :place_categories
  has_many :categories, through: :place_categories
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :users, through: :place_views
  has_many :search_logs, dependent: :destroy
  belongs_to :city
  has_many :open_days
  has_many :sliders


  # validations
  #
  # validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
  # validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_presence_of :name, :about, :address, :city, :phone, :user, :tagline
  before_validation :geocode_address


  # nested attributes
  #
  accepts_nested_attributes_for :open_days, reject_if: :all_blank
  accepts_nested_attributes_for :sliders, reject_if: :all_blank, allow_destroy: true


  # scopes
  #
  scope :featured, -> {
    where(featured: :true).order("RANDOM()").limit(12)
  }


  # callbacks
  #
  before_validation :strip_links
  after_save :update_role
  # before_create { self.featured = !user.subscription_id.nil? }


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
      '5.0'
    end
  end


  def rating_count
    if self.comments.size > 0
      self.comments.size
    else
      20
    end
  end


  def update_role
    if self.user_id_changed? and self.user.has_role?(:regular)
      u = self.user
      role_id = Role.where(name: "place_owner").first.id
      u.role_ids = role_id
      u.save
    end
  end


  def add_open_days
    if self.open_days.empty?
      Enum::Place::DAY_NAME[:options].each do |day|
        self.open_days.build(day_in_week: day)
      end
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
    self.facebook = Addressable::URI.parse(facebook).path.split('/')[1] unless facebook.blank?
    self.twitter = Addressable::URI.parse(twitter).path.split('/')[1] unless twitter.blank?
    self.instagram = Addressable::URI.parse(instagram).path.split('/')[1] unless instagram.blank?
  end


  #
  #
  def slug_candidates
    [
      :name,
      [:name, city.name],
      [:name, city.name, city.country]
    ]
  end
end
