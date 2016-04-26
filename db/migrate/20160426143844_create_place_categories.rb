class CreatePlaceCategories < ActiveRecord::Migration
  def change
    create_table :place_categories do |t|
      t.integer :place_id
      t.integer :category_id
    end
  end
end
