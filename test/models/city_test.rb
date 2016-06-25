# == Schema Information
#
# Table name: cities
#
#  id                 :integer          not null, primary key
#  about              :text
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  lng                :float
#  lat                :float
#  radius             :float
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  slug               :string
#  distance           :float
#  country_id         :integer
#

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
