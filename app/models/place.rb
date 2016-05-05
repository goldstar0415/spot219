class Place < ActiveRecord::Base
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
  validates :city, presence: true
  validates :phone, presence: true
  validates :address, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
  
  
  ratyrate_rateable 'name'
  
  searchable do
    text :name, :boost => 0
    text :about, :city
    text :categories do
      categories.map(&:name)
    end
  end
  
  def average_rating
    if self.comments.size > 0
        self.comments.average(:number).round(1)
    else
        '5.0'
    end
  end
  
  
  
end
