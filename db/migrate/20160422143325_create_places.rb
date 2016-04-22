class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :about
      t.string :country
      t.string :city
      t.string :address
      t.string :phone
      t.string :fb
      t.string :twit
      t.string :insta
      t.string :web

      t.timestamps
    end
  end
end
