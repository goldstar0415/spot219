class UpdateOpenDaysTable < ActiveRecord::Migration
  def change
    remove_column :open_days, :open, :boolean
  end
end
