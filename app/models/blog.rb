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
#  impressions_count :integer
#  image             :string
#  slug              :string
#

class Blog < ActiveRecord::Base
  # plugins
  #
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

  def average_rating
    average = (self.views_number/20).round(1)
    average = 1 if average == 0
    average
  end
end
