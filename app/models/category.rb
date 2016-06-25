# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#  slug       :string
#

class Category < ActiveRecord::Base
  # plugins
  #
  extend FriendlyId
  friendly_id :name


  # relations
  #
  has_many :place_categories, dependent: :destroy
  has_many :places, through: :place_categories


  # validations
  #
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
