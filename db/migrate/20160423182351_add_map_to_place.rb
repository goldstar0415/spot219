class AddMapToPlace < ActiveRecord::Migration
  def change
    add_column :places, :map, :string
  end
end
