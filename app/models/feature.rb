# == Schema Information
#
# Table name: features
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

class Feature < ActiveRecord::Base
  # plugins
  #
  extend FriendlyId
  friendly_id :name


  # relations
  #
  has_and_belongs_to_many :subscriptions, join_table: :subscriptions_features


  # validations
  #
  validates :name, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }


  def should_generate_new_friendly_id?
    slug.blank?
  end
end
