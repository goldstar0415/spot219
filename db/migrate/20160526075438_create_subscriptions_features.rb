class CreateSubscriptionsFeatures < ActiveRecord::Migration
  def change
    create_table :subscriptions_features do |t|
      t.belongs_to :subscription, index: true
      t.belongs_to :feature, index: true
    end
  end
end
