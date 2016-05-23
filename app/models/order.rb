class Order < ActiveRecord::Base
  enum status: [ :pending, :payment, :completed ]

  has_many :order_details
  belongs_to :order_info
  belongs_to :billing_address
  belongs_to :delivery_address
  belongs_to :user
end
