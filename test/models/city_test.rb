# == Schema Information
#
# Table name: cities
#
#  id                 :integer          not null, primary key
#  first_name         :string
#  last_name          :string
#  email              :string
#  about              :text
#  city_name          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  longitude          :float
#  latitude           :float
#  radius             :float
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  subdomain          :string
#

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
