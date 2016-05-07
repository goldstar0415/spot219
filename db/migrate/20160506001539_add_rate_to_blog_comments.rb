class AddRateToBlogComments < ActiveRecord::Migration
  def change
    add_column :blog_comments, :number, :integer
  end
end
