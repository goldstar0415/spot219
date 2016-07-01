# == Schema Information
#
# Table name: blogs
#
#  id                :integer          not null, primary key
#  title             :string
#  body              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  description       :string
#  city_id           :integer
#  impressions_count :integer          default(0)
#  image             :string
#  slug              :string
#

class Blog < ActiveRecord::Base
  # plugins
  #
  resourcify
  extend FriendlyId
  friendly_id :slug_candidates
  is_impressionable counter_cache: true
  mount_uploader :image, ImageUploader


  # relations
  #
  belongs_to :city
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  # def increment(by = 1)
  #   self.views_number ||= 0
  #   self.views_number += by
  #   self.save
  # end


  # validations
  #
  validates_presence_of :title, :body, :user, :city


  #
  #
  def average_rating
    average = (self.impressions_count.to_i / 20).round(1)
    average = 1 if average == 0
    average
  end


  #
  #
  def should_generate_new_friendly_id?
    slug.blank?
  end


  #
  #
  def slug_candidates
    [
      :name,
      [:name, city.name],
      [:name, city.name, city.country]
    ]
  end
end
