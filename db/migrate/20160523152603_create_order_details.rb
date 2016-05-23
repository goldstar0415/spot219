class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :place_id
      t.integer :quantiy, default: 0
      t.decimal :price, :precision => 8, :scale => 2, default: 0
      t.decimal :tax, :precision => 8, :scale => 2, default: 0
      t.decimal :sub_total, :precision => 8, :scale => 2, default: 0

      t.timestamps null: false
    end
  end
end
