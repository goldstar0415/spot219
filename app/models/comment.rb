class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  validates :title, presence: true, length: {minimum: 3, maximum: 25}
  validates :description, presence: true, length: {minimum: 3, maximum: 100}
  
  
end
