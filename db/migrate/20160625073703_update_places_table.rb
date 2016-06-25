class UpdatePlacesTable < ActiveRecord::Migration
  def change
    remove_column :places, :image_file_name, :string
    remove_column :places, :image_content_type, :string
    remove_column :places, :image_file_size, :integer
    remove_column :places, :image_updated_at, :datetime
    change_column :places, :slug, :string, index: true
    add_column :places, :image, :string
  end
end
