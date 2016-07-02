class UpdateBlogsTable < ActiveRecord::Migration
  def change
    add_column :blogs, :counter_cache, :integer
    remove_column :blogs, :views_number, :integer
    add_column :blogs, :image, :string
    add_column :blogs, :slug, :string
  end
end
