# == Schema Information
#
# Table name: package_options
#
#  id          :integer          not null, primary key
#  package_id  :integer
#  interval    :string
#  price_cents :money
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PackageOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
