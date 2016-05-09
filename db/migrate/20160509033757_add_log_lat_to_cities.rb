class AddLogLatToCities < ActiveRecord::Migration
  def change
    add_column :cities, :longitude, :float
    add_column :cities, :latitude, :float
    add_column :cities, :radius, :float
  end
end
