# == Schema Information
#
# Table name: campaigns
#
#  id         :integer          not null, primary key
#  budget     :float
#  name       :string
#  user_id    :integer
#  running    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :integer
#

class Campaign < ActiveRecord::Base
  # relations
  #
  belongs_to :user
  belongs_to :place


  #
  #
  validates_presence_of :name, :budget, :user, :place
end
