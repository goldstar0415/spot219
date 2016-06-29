class SetDefaultViewCountToZero < ActiveRecord::Migration
  def change
    change_column :places, :impressions_count, :integer, default: 0
    change_column :blogs, :impressions_count, :integer, default: 0
  end
end
