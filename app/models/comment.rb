# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string
#

class Comment < ActiveRecord::Base
  # relations
  #
  belongs_to :user
  belongs_to :commentable, polymorphic: true


  # validations
  #
  validates :title, :description, presence: true
end
