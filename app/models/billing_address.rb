# == Schema Information
#
# Table name: billing_addresses
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  line         :string
#  city         :string
#  country      :string
#  postcode     :string
#  country_code :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class BillingAddress < ActiveRecord::Base
  attr_accessor :add_delivery
  belongs_to :user
end
