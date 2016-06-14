class AddNameToCampaign < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.float :budget
      t.string :name
      t.integer :user_id
      t.boolean :running

      t.timestamps null: false
    end
  end
end
