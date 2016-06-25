# == Schema Information
#
# Table name: places
#
#  id                :integer          not null, primary key
#  name              :string
#  about             :text
#  address           :string
#  phone             :string
#  facebook          :string
#  twitter           :string
#  instagram         :string
#  web               :string
#  created_at        :datetime
#  updated_at        :datetime
#  user_id           :integer
#  city_id           :integer
#  lat               :float
#  lng               :float
#  tagline           :string
#  slug              :string
#  featured          :boolean          default(FALSE)
#  image             :string
#  impressions_count :integer
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
