# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
