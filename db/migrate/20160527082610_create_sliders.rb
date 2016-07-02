class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :name
      t.string :image
      t.integer :position
      t.integer :user_id
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
