# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  lat        :float
#  lon        :float
#  distance   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
