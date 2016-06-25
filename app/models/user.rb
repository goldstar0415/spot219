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
  # plugins
  #
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter, :google]
  rolify
  # mount_uploader :avatar, AvatarUploader


  # relations
  #
  has_many :places
  has_many :comments
  has_many :place_comments, -> { where(commentable_type: 'Place') }, class_name: 'Comment'
  has_many :blog_comments, -> { where(commentable_type: 'Blog') }, class_name: 'Comment'
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


  # validations
  #
  validates_presence_of :first_name, :last_name


  # callbacks
  #
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
