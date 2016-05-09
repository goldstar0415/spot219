class AddImageToCity < ActiveRecord::Migration
  def up
    add_attachment :cities, :image
  end

  def down
    remove_attachment :cities, :image
  end
end
