# == Schema Information
#
# Table name: claims
#
#  id                 :integer          not null, primary key
#  email              :string           default(""), not null
#  first_name         :string           default("")
#  last_name          :string           default("")
#  proof_file_name    :string
#  proof_content_type :string
#  proof_file_size    :integer
#  proof_updated_at   :datetime
#  phone              :string
#  reason             :text
#  status             :integer
#  user_id            :integer
#  place_id           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Claim < ActiveRecord::Base
  enum status: [ :pending, :approve, :deny ]

  belongs_to :user
  belongs_to :place

  before_create :set_default_status
  after_save :check_state

  has_attached_file :proof
  validates_with AttachmentSizeValidator, attributes: :proof, less_than: 5.megabytes
  validates_attachment :proof, :content_type => { :content_type => %w(image/jpeg image/jpg image/gif image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document text/plain) }

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :place_id, presence: true

  def set_default_status
    self.status = "pending"
  end

  def check_state
    if self.status_changed?
      if self.status == "approve"
        self.place.update(user_id: self.user_id) if self.user_id.present?
        ClaimMailer.delay.sent_approve_claim(self.email)
      elsif self.status == "deny"
        ClaimMailer.delay.sent_deny_claim(self.email)
      end
    end
  end
end
