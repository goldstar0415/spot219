class RemovePackageFromSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :package, :string
  end
end
