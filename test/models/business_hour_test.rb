# == Schema Information
#
# Table name: business_hours
#
#  id         :integer          not null, primary key
#  place_id   :integer
#  sun        :boolean
#  sun_open   :time
#  sun_close  :time
#  mon        :boolean
#  mon_open   :time
#  mon_close  :time
#  tue        :boolean
#  tue_open   :time
#  tue_close  :time
#  wed        :boolean
#  wed_open   :time
#  wed_close  :time
#  thu        :boolean
#  thu_open   :time
#  thu_close  :time
#  fri        :boolean
#  fri_open   :time
#  fri_close  :time
#  sat        :boolean
#  sat_open   :time
#  sat_close  :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BusinessHourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
