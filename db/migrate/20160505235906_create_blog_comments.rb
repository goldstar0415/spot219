class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
