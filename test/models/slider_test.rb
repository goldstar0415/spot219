# == Schema Information
#
# Table name: sliders
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  user_id    :integer
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

require 'test_helper'

class SliderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
