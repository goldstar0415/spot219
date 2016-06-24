# == Schema Information
#
# Table name: features
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

class Feature < ActiveRecord::Base
  has_and_belongs_to_many :subscriptions, join_table: :subscriptions_features

  before_save :add_slug

  validates :name, presence: true
  validates :name, presence: true, uniqueness: true

  def add_slug
    if self.slug.blank?
      self.slug = name.parameterize
    end
  end

end
