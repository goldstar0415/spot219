# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  day_delivery        :integer          default(0)
#  price_delivery      :decimal(8, 2)    default(0.0)
#  total_item          :integer          default(0)
#  total_excluding_tax :decimal(8, 2)    default(0.0)
#  total_price         :decimal(8, 2)    default(0.0)
#  tax                 :decimal(8, 2)    default(0.0)
#  order_info_id       :integer
#  billing_address_id  :integer
#  delivery_address_id :integer
#  status              :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Order < ActiveRecord::Base
  enum status: [ :pending, :payment, :completed ]

  has_many :order_details
  accepts_nested_attributes_for :order_details
  belongs_to :order_info
  belongs_to :billing_address
  belongs_to :delivery_address
  belongs_to :user
end
