class RenameUserIdToOwnerIdOnPlaces < ActiveRecord::Migration
  def change
    rename_column :places, :user_id, :owner_id
  end
end
