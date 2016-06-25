class UpdateBlogsTable < ActiveRecord::Migration
  def change
    add_column :blogs, :counter_cache, :integer
    remove_column :blogs, :img_file_name, :string
    remove_column :blogs, :img_content_type, :string
    remove_column :blogs, :img_file_size, :integer
    remove_column :blogs, :img_updated_at, :datetime
    remove_column :blogs, :views_number, :integer
    add_column :blogs, :image, :string
    add_column :blogs, :slug, :string
  end
end
