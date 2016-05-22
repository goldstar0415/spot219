class Place < ActiveRecord::Base
  searchkick

  after_save :update_role
  after_create :add_open_days

  belongs_to :user
  has_many :place_categories
  has_many :categories, through: :place_categories
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { medium: "640x426>", thumb: "200x134#" }
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :about, presence: true, length: { minimum: 5, maximum: 500 }
  validates :country, presence: true
  validates :city_id, presence: true
  validates :phone, presence: true
  validates :address, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
  belongs_to :city
  has_many :open_days
  accepts_nested_attributes_for :open_days , :reject_if => :all_blank

  ratyrate_rateable 'name'

  def search_data
    {
      name: name,
      about: about,
      city: city.try(:city_name),
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
      role_id =Role.where(name: "place_owner").first.id
      u.role_ids = role_id
      u.save
    end
  end

  def add_open_days
    if self.open_days.blank?
      Date::DAYNAMES.each do |day|
        open_day = self.open_days.new(day_in_week: day, open: false)
        open_day.save
      end
    end
  end
end
