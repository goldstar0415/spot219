# == Schema Information
#
# Table name: search_logs
#
#  id         :integer          not null, primary key
#  keyword    :string
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SearchLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
