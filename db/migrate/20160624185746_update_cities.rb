class UpdateCities < ActiveRecord::Migration
  def change
    add_reference :cities, :country
    rename_column :cities, :longitude, :lng
    rename_column :cities, :latitude, :lat
    change_column :cities, :distance, :float
  end
end
