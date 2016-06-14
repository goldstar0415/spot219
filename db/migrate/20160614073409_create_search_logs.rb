class CreateSearchLogs < ActiveRecord::Migration
  def change
    create_table :search_logs do |t|
      t.string :keyword
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
