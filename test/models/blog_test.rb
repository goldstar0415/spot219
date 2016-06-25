# == Schema Information
#
# Table name: blogs
#
#  id            :integer          not null, primary key
#  title         :string
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  description   :string
#  city_id       :integer
#  counter_cache :integer
#  image         :string
#  slug          :string
#

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
