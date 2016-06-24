# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  place_id   :integer
#  quantity   :integer          default(0)
#  price      :decimal(8, 2)    default(0.0)
#  tax        :decimal(8, 2)    default(0.0)
#  sub_total  :decimal(8, 2)    default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
