class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2, default: 0
      t.integer :package
    end
  end
end
