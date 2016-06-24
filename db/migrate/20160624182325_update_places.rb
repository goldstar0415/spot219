class UpdatePlaces < ActiveRecord::Migration
  def change
    remove_column :places, :city, :string
    remove_column :places, :country, :string
    remove_column :places, :map, :string
    remove_column :places, :description, :string
    rename_column :places, :title, :tagline
    rename_column :places, :subdomain, :slug
    rename_column :places, :fb, :facebook
    rename_column :places, :twit, :twitter
    rename_column :places, :insta, :instagram
    rename_column :places, :latitude, :lat
    rename_column :places, :longitude, :lng
  end
end
