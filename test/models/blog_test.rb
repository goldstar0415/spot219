# == Schema Information
#
# Table name: blogs
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  img_file_name    :string
#  img_content_type :string
#  img_file_size    :integer
#  img_updated_at   :datetime
#  user_id          :integer
#  description      :string
#  views_number     :integer          default(0)
#  city_id          :integer
#

require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
