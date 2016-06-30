class AddPlaceToCampaigns < ActiveRecord::Migration
  def change
    add_reference :campaigns, :place, index: true, foreign_key: true
    change_column :campaigns, :running, :boolean, default: false
  end
end
