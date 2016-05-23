class BillingAddress < ActiveRecord::Base
  attr_accessor :add_delivery
  belongs_to :user
end
