# == Schema Information
#
# Table name: delivery_addresses
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string
#  line         :string
#  city         :string
#  country      :string
#  postcode     :string
#  country_code :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class DeliveryAddress < ActiveRecord::Base
  belongs_to :user
end
