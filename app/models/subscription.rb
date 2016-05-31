class Subscription < ActiveRecord::Base
  has_and_belongs_to_many :features, join_table: :subscriptions_features
  #accepts_nested_attributes_for :features

  enum package: [ :free, :package1, :package2 ]
  validates :name, presence: true

  has_many :users

  def paypal_url(return_url)
    values = {
      :business => ENV['Paypal_Business'],
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => invoice_number,
      :amount_1 => self.price,
      :item_name_1 => self.name,
      :item_number_1 => self.id,
      :quantity_1 => 1
    }

    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  def invoice_number
    (0...8).map { (65 + rand(26)).chr }.join
  end
end
