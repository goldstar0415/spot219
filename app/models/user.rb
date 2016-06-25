# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  admin                  :boolean          default(FALSE)
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  city_id                :integer
#  subscription_id        :integer
#  gender                 :boolean
#  provider               :string
#  uid                    :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter, :google]
  rolify

  has_many :places
  has_many :comments
  has_many :blog_comments
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :blogs
  has_many :campaigns, dependent: :destroy

  belongs_to :city

  has_many :cities
  has_one :order_info
  has_one :billing_address
  has_one :delivery_address
  has_many :sliders
  belongs_to :subscription
  has_many :place_views

  validates :first_name, presence: true
  validates :last_name, presence: true

  # has_attached_file :avatar, styles: { thumb: "55x55#" },
  #   default_url: "avatar.png"

  # validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 5.megabytes
  # validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  before_save do
    if subscription_id_changed?
      places.update_all featured: !self.subscription_id.nil?
    end
  end

  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count < 1
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

  def self.search(param)
    return User.none if param.blank?

    param.strip!
    param.downcase!
    (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
  end

  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
end
