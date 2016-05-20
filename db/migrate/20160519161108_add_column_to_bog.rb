class AddColumnToBog < ActiveRecord::Migration
  def change
    add_column :blogs, :description, :string
    add_column :blogs, :views_number, :integer, default: 0
  end
end
