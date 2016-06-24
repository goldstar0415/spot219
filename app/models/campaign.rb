# == Schema Information
#
# Table name: campaigns
#
#  id         :integer          not null, primary key
#  budget     :float
#  name       :string
#  user_id    :integer
#  running    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Campaign < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
end
