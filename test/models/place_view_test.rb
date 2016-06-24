# == Schema Information
#
# Table name: place_views
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  featured   :boolean
#

require 'test_helper'

class PlaceViewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
