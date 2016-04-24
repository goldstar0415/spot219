class AddAttachmentImageToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :places, :image
  end
end
