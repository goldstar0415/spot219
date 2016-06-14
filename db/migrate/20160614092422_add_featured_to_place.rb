class AddFeaturedToPlace < ActiveRecord::Migration
  def change
    add_column :places, :featured, :boolean, default: false
    Place.find_each do |item|
      item.update featured: !item.user.subscription_id.nil?
    end
  end
end
