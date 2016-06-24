# == Schema Information
#
# Table name: blog_comments
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  blog_id     :integer
#  number      :integer
#

require 'test_helper'

class BlogCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
