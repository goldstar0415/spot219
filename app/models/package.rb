# == Schema Information
#
# Table name: packages
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Package < ActiveRecord::Base
  # relations
  #
  has_many :options, dependent: :destroy, class_name: 'PackageOption'
  has_and_belongs_to_many :features, join_table: :features_packages
end
