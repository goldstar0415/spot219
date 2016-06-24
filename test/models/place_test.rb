# == Schema Information
#
# Table name: places
#
#  id                 :integer          not null, primary key
#  name               :string
#  about              :text
#  address            :string
#  phone              :string
#  facebook           :string
#  twitter            :string
#  instagram          :string
#  web                :string
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  city_id            :integer
#  lat                :float
#  lon                :float
#  tagline            :string
#  slug               :string
#  featured           :boolean          default(FALSE)
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
