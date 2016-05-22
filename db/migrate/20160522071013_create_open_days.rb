class CreateOpenDays < ActiveRecord::Migration
  def change
    create_table :open_days do |t|
      t.integer :place_id
      t.string :day_in_week
      t.time :start_time
      t.time :end_time
      t.boolean :open, default: false
    end
  end
end
