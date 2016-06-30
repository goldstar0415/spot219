class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.float :ppc_price

      t.timestamps null: false
    end
  end
end
