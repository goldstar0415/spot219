class UpdateCitiesTable < ActiveRecord::Migration
  def change
    remove_column :cities, :first_name, :string
    remove_column :cities, :last_name, :string
    remove_column :cities, :email, :string
    rename_column :cities, :city_name, :name
    rename_column :cities, :subdomain, :slug
  end
end
