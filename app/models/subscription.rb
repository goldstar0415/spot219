# == Schema Information
#
# Table name: subscriptions
#
#  id    :integer          not null, primary key
#  name  :string
#  price :decimal(8, 2)    default(0.0)
#

class Subscription < ActiveRecord::Base
  # relations
  #
  has_and_belongs_to_many :features, join_table: :subscriptions_features
  has_many :subscribers, class_name: 'User'
  # enum package: [ :free, :package1, :package2 ]


  #accepts_nested_attributes_for :features


  # validations
  #
  validates :name, presence: true

  def paypal_url(return_url)
    values = {
      business: ENV['Paypal_Business'],
      cmd: '_cart',
      upload: 1,
      return: return_url,
      invoice: invoice_number,
      amount_1: self.price,
      item_name_1: self.name,
      item_number_1: self.id,
      quantity_1: 1
    }

    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  def invoice_number
    (0...8).map { (65 + rand(26)).chr }.join
  end
end
