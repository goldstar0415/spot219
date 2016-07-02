# == Schema Information
#
# Table name: package_options
#
#  id          :integer          not null, primary key
#  package_id  :integer
#  interval    :string
#  price_cents :money
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PackageOption < ActiveRecord::Base
  # plugins
  #
  extend Enumerize
  enumerize :interval, in: Enum::Package::INTERVAL[:options]


  # relations
  #
  belongs_to :package
end
