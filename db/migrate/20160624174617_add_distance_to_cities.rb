class AddDistanceToCities < ActiveRecord::Migration
  def change
    add_column :cities, :distance, :integer
  end
end
