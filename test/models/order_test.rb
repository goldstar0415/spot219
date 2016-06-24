# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  day_delivery        :integer          default(0)
#  price_delivery      :decimal(8, 2)    default(0.0)
#  total_item          :integer          default(0)
#  total_excluding_tax :decimal(8, 2)    default(0.0)
#  total_price         :decimal(8, 2)    default(0.0)
#  tax                 :decimal(8, 2)    default(0.0)
#  order_info_id       :integer
#  billing_address_id  :integer
#  delivery_address_id :integer
#  status              :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
