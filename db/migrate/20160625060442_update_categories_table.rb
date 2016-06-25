class UpdateCategoriesTable < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string, index: true
  end
end
