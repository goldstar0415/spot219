class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :day_delivery, default: 0
      t.decimal :price_delivery, :precision => 8, :scale => 2, default: 0
      t.integer :total_item, default: 0
      t.decimal :total_excluding_tax, :precision => 8, :scale => 2, default: 0
      t.decimal :total_price, :precision => 8, :scale => 2, default: 0
      t.decimal :tax, :precision => 8, :scale => 2, default: 0
      t.integer :order_info_id
      t.integer :billing_address_id
      t.integer :delivery_address_id
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
