# == Schema Information
#
# Table name: places
#
#  id                 :integer          not null, primary key
#  name               :string
#  about              :text
#  address            :string
#  phone              :string
#  facebook           :string
#  twitter            :string
#  instagram          :string
#  web                :string
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  city_id            :integer
#  lat                :float
#  lng                :float
#  tagline            :string
#  slug               :string
#  featured           :boolean          default(FALSE)
#

class Place < ActiveRecord::Base
  # plugins
  #
  # searchkick
  # has_attached_file :image, styles: { medium: "640x426>", thumb: "200x134#" }
  extend FriendlyId
  friendly_id :name


  # relations
  #
  belongs_to :user
  has_many :place_categories
  has_many :categories, through: :place_categories
  has_many :comments, dependent: :destroy
  has_many :place_views, dependent: :destroy
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


  # nested attributes
  #
  accepts_nested_attributes_for :open_days, reject_if: :all_blank
  accepts_nested_attributes_for :sliders, reject_if: :all_blank, allow_destroy: true


  # scopes
  #
  scope :feature, -> {
    where(featured: :true).order("RANDOM()").limit(12)
  }


  # callbacks
  #
  # after_save :update_role
  # before_create { self.featured = !user.subscription_id.nil? }


  def search_data
    {
      name: name,
      about: about,
      city: city.try(:name),
      categories: categories.map(&:name)
    }
  end


  def view! user_id
    place_views.create(user_id: user_id, featured: self.featured)
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
      Date::DAYNAMES.each do |day|
        self.open_days.build(day_in_week: day, open: false)
      end
    end
  end


  def price
    5
  end
end
