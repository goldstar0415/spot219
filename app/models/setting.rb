# == Schema Information
#
# Table name: settings
#
#  id         :integer          not null, primary key
#  ppc_price  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Setting < ActiveRecord::Base
end
