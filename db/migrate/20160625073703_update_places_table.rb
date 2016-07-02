class UpdatePlacesTable < ActiveRecord::Migration
  def change
    change_column :places, :slug, :string, index: true
    add_column :places, :image, :string
  end
end
