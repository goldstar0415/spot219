class ChangeCountryOnCities < ActiveRecord::Migration
  def change
    drop_table :countries
    remove_reference :cities, :country
    add_column :cities, :country, :string, index: true
  end
end
