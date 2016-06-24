# == Schema Information
#
# Table name: places
#
#  id                 :integer          not null, primary key
#  name               :string
#  about              :text
#  country            :string
#  city               :string
#  address            :string
#  phone              :string
#  fb                 :string
#  twit               :string
#  insta              :string
#  web                :string
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  map                :string
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  city_id            :integer
#  latitude           :float
#  longitude          :float
#  title              :string
#  description        :string
#  subdomain          :string
#  featured           :boolean          default(FALSE)
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
