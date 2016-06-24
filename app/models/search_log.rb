# == Schema Information
#
# Table name: search_logs
#
#  id         :integer          not null, primary key
#  keyword    :string
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SearchLog < ActiveRecord::Base
  belongs_to :place

  scope :in_period, ->(period) {
    now = DateTime.now
    case period.to_i
    when 1
      where(created_at: now.beginning_of_day..now.end_of_day)
    when 2
      where(created_at: now.beginning_of_week..now.end_of_week)
    when 3
      where(created_at: now.beginning_of_month..now.end_of_month)
    when 4
      where(created_at: 2.month.from_now.beginning_of_month..now.end_of_month)
    when 5
      where(created_at: now.beginning_of_year..now.end_of_year)
    end
  }
end
