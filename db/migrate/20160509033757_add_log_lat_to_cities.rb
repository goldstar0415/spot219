class AddLogLatToCities < ActiveRecord::Migration
  def change
    add_column :cities, :log, :string
    add_column :cities, :lat, :string
    add_column :cities, :radius, :float
  end
end
