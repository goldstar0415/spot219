class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :slug
      t.float :lat
      t.float :lng
      t.float :distance

      t.timestamps null: false
    end
  end
end
