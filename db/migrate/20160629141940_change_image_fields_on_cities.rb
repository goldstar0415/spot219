class ChangeImageFieldsOnCities < ActiveRecord::Migration
  def change
    rename_column :cities, :image_file_name, :image
    remove_column :cities, :image_content_type, :string
    remove_column :cities, :image_file_size, :integer
    remove_column :cities, :image_updated_at, :datetime
  end
end
