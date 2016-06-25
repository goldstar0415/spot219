# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  lat        :float
#  lng        :float
#  distance   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Country < ActiveRecord::Base
  # plugins
  #
  extend FriendlyId
  friendly_id :name
  acts_as_mappable auto_geocode: { field: :name, error_message: 'Could not geocode city'}


  # relations
  #
  has_many :cities, dependent: :destroy


  # validations
  #
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
