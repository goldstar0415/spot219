# == Schema Information
#
# Table name: open_days
#
#  id          :integer          not null, primary key
#  place_id    :integer
#  day_in_week :string
#  start_time  :time
#  end_time    :time
#

class OpenDay < ActiveRecord::Base
  # plugins
  #
  extend Enumerize
  enumerize :day_in_week, in: Enum::Place::DAY_NAME[:options]


  # relations
  #
  belongs_to :place


  # validations
  #
  validates_presence_of :day_in_week, :start_time, :end_time
  validates_uniqueness_of :day_in_week, case_sensitive: false, scope: :place
end
