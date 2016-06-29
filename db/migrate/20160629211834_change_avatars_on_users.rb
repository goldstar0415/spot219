class ChangeAvatarsOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :avatar_file_name, :avatar
    remove_column :users, :avatar_content_type, :string
    remove_column :users, :avatar_file_size, :integer
    remove_column :users, :avatar_updated_at, :datetime
  end
end
