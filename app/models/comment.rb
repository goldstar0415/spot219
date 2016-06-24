# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  place_id    :integer
#  number      :integer
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  validates :title, presence: true, length: {minimum: 3, maximum: 25}
  validates :description, presence: true, length: {minimum: 3, maximum: 100}
  
  
end
