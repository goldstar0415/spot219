# == Schema Information
#
# Table name: subscription_periods
#
#  id              :integer          not null, primary key
#  subscription_id :integer
#  period          :string
#  price_cents     :money
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class SubscriptionPeriodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
