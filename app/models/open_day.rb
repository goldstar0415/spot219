# == Schema Information
#
# Table name: open_days
#
#  id          :integer          not null, primary key
#  place_id    :integer
#  day_in_week :string
#  start_time  :time
#  end_time    :time
#  open        :boolean          default(FALSE)
#

class OpenDay < ActiveRecord::Base
  belongs_to :place
end
