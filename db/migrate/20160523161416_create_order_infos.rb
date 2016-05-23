class CreateOrderInfos < ActiveRecord::Migration
  def change
    create_table :order_infos do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
