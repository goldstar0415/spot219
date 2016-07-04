class CreateBusinessHours < ActiveRecord::Migration
  def change
    create_table :business_hours do |t|
      t.references :place, index: true, foreign_key: true

      Enum::Place::DAY_NAME[:options].each do |dayname|
        t.boolean "#{dayname}"
        t.time "#{dayname}_open"
        t.time "#{dayname}_close"
      end

      t.timestamps null: false
    end
  end
end
