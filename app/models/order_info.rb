# == Schema Information
#
# Table name: order_infos
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  first_name :string
#  last_name  :string
#  company    :string
#  email      :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderInfo < ActiveRecord::Base
  belongs_to :user
end
