class BlogComment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :blog
  validates :title, presence: true, length: {minimum: 3, maximum: 25}
  validates :description, presence: true, length: {minimum: 3, maximum: 100}
  
end
