class UpdateSlidersTable < ActiveRecord::Migration
  def change
    remove_column :sliders, :image_file_name, :string
    remove_column :sliders, :image_content_type, :string
    remove_column :sliders, :image_file_size, :integer
    remove_column :sliders, :image_updated_at, :datetime
    add_column :sliders, :image, :string
  end
end
