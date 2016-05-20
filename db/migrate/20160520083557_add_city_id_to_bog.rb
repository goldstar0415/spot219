class AddCityIdToBog < ActiveRecord::Migration
  def change
    add_column :blogs, :city_id, :integer
  end
end
