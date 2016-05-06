class AddBlogIdToBlogComments < ActiveRecord::Migration
  def change
    add_column :blog_comments, :blog_id, :integer
  end
end
