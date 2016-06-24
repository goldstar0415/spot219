# == Schema Information
#
# Table name: order_infos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  first_name :string
#  last_name  :string
#  company    :string
#  email      :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrderInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
