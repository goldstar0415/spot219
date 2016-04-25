class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :about
      t.string :city_name

      t.timestamps null: false
    end
  end
end
