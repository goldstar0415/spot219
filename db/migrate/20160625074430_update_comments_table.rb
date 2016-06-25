class UpdateCommentsTable < ActiveRecord::Migration
  def change
    remove_reference :comments, :place
    remove_column :comments, :number, :integer
    add_column :comments, :commentable_id, :integer, index: true
    add_column :comments, :commentable_type, :string
  end
end
