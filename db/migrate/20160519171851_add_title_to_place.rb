class AddTitleToPlace < ActiveRecord::Migration
  def change
    add_column :places, :title, :string
    add_column :places, :description, :string
  end
end
