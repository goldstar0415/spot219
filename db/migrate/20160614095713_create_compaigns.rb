class CreateCompaigns < ActiveRecord::Migration
  def change
    create_table :compaigns do |t|
      t.float :budget
      t.integer :user_id
      t.boolean :running

      t.timestamps null: false
    end
  end
end
