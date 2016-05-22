class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :user_id
      t.integer :total
      t.decimal :total_price, :precision => 8, :scale => 2
      t.timestamps null: false
    end
  end
end
