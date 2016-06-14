class PlaceView < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  scope :featured, ->{ where(featured: true) }
end
