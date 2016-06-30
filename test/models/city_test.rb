# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  about      :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lng        :float
#  lat        :float
#  radius     :float
#  image      :string
#  slug       :string
#  distance   :float
#  country    :string
#  creator_id :integer
#

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
