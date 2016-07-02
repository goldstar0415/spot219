class CreateSubscriptionOptions < ActiveRecord::Migration
  def change
    create_table :subscription_options do |t|
      t.references :subscription, index: true, foreign_key: true
      t.string :period
      t.money :price_cents

      t.timestamps null: false
    end

    remove_column :subscriptions, :price, :decimal
  end
end
