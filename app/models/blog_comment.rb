# == Schema Information
#
# Table name: blog_comments
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  blog_id     :integer
#  number      :integer
#

class BlogComment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :blog
  validates :title, presence: true, length: {minimum: 3, maximum: 25}
  validates :description, presence: true, length: {minimum: 3, maximum: 100}
  
end
