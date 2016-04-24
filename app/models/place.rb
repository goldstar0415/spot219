class Place < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { medium: "640x426>", thumb: "200x134#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :about, presence: true, length: { minimum: 10, maximum: 500 }
  validates :country, presence: true
  validates :city, presence: true
  validates :phone, presence: true
  validates :address, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
  
end
