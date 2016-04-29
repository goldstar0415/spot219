class CreateComments < ActiveRecord::Migration
  drop_table :comments
  def change
    create_table :comments do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
