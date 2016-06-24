# == Schema Information
#
# Table name: billing_addresses
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  line         :string
#  city         :string
#  country      :string
#  postcode     :string
#  country_code :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BillingAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
