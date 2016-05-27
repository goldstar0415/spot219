class City < ActiveRecord::Base
  belongs_to :user
  has_many :users
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { minimum: 10 }
  validates :about, presence: true
  validates :city_name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
  validates :subdomain, presence: true, uniqueness: true


  has_many :places
  validates_presence_of :latitude, :longitude, :radius
  reverse_geocoded_by :latitude, :longitude

  has_many :blogs

  has_attached_file :image, styles: { medium: "640x426>", thumb: "200x134#" }
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

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

  def self.find id
    self.find_by(subdomain: id) || self.find_by(id: id)
  end

  def to_param
    self.subdomain || id.to_s
  end
end
