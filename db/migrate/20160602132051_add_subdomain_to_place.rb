class AddSubdomainToPlace < ActiveRecord::Migration
  def up
    add_column :places, :subdomain, :string
    add_index :places, :subdomain,  unique: true

    Place.find_each do |place|
      place.update_attribute(:subdomain, "subdomain#{place.id}")
    end
  end

  def down
    remove_column :places, :subdomain
  end
end
