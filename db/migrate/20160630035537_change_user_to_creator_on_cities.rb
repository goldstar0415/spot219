class ChangeUserToCreatorOnCities < ActiveRecord::Migration
  def change
    remove_reference :cities, :user
    add_reference :cities, :creator
  end
end
