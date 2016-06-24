# == Schema Information
#
# Table name: place_categories
#
#  id          :integer          not null, primary key
#  place_id    :integer
#  category_id :integer
#

class PlaceCategory < ActiveRecord::Base
  
  belongs_to :place
  belongs_to :category

end
