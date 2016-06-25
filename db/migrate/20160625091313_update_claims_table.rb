class UpdateClaimsTable < ActiveRecord::Migration
  def change
    rename_column :claims, :proof_file_name, :proof
    remove_column :claims, :proof_content_type, :string
    remove_column :claims, :proof_file_size, :integer
    remove_column :claims, :proof_updated_at, :datetime
  end
end
