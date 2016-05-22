class AddSubdomainToCity < ActiveRecord::Migration
  def change
    add_column :cities, :subdomain, :string
    add_index :cities, :subdomain,  unique: true
  end
end
