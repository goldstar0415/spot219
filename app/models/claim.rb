# == Schema Information
#
# Table name: claims
#
#  id         :integer          not null, primary key
#  email      :string           default(""), not null
#  first_name :string           default("")
#  last_name  :string           default("")
#  phone      :string
#  proof      :string
#  reason     :text
#  status     :integer
#  user_id    :integer
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Claim < ActiveRecord::Base
  # plugins
  #
  extend Enumerize
  enumerize :status, in: [:pending, :approved, :denied], default: :pending
  mount_uploader :proof, DocumentUploader


  # relations
  #
  belongs_to :user
  belongs_to :place


  # callbacks
  #
  after_save :check_state


  # validations
  #
  validates_presence_of :first_name, :last_name, :email, :place, :proof
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  def check_state
    if self.status_changed?
      if self.status == "approved"
        self.place.update(user_id: self.user_id) if self.user_id.present?
        ClaimMailer.delay.sent_approve_claim(self.email)
      elsif self.status == "denied"
        ClaimMailer.delay.sent_deny_claim(self.email)
      end
    end
  end
end
