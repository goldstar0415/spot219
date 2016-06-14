class CreatePlaceViews < ActiveRecord::Migration
  def change
    create_table :place_views do |t|
      t.integer :user_id
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
