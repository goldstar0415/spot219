class AddAttachmentImgToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :blogs, :img
  end
end
