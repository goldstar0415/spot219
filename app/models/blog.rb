class Blog < ActiveRecord::Base

  belongs_to :user
  has_many :blog_comments, dependent: :destroy
  has_attached_file :img, styles: { medium: "640x426>", thumb: "200x134#" }
  validates_with AttachmentSizeValidator, attributes: :img, less_than: 5.megabytes
  validates_attachment :img, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

  def increment(by = 1)
    self.views_number ||= 0
    self.views_number += by
    self.save
  end

  def average_rating
    average = (self.views_number/20).round(1)
    average =  1 if average==0
    average
  end
end
