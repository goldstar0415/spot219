class AddFeaturedToPlaceReview < ActiveRecord::Migration
  def change
    add_column :place_views, :featured, :boolean
  end
end
