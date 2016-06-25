class RenameImpressionistColumns < ActiveRecord::Migration
  def change
    add_column :places, :impressions_count, :integer
    rename_column :blogs, :counter_cache, :impressions_count
  end
end
