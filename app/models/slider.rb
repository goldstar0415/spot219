# == Schema Information
#
# Table name: sliders
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  user_id    :integer
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

class Slider < ActiveRecord::Base
  # plugins
  #
  mount_uploader :image, ImageUploader


  # relations
  #
  belongs_to :user
  belongs_to :place
end
