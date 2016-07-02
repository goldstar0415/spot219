# == Schema Information
#
# Table name: subscription_options
#
#  id              :integer          not null, primary key
#  subscription_id :integer
#  period          :string
#  price_cents     :money
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class SubscriptionOption < ActiveRecord::Base
  # relations
  #
  belongs_to :subscription
  has_many :subscribers, class_name: 'User', dependent: :nullify
end
