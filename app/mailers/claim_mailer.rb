class ClaimMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.claim_mailer.sent_approve_claim.subject
  #
  def sent_approve_claim email
    @greeting = "Hi"

    mail(to: email, subject: 'Turkish Approve claim mail')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.claim_mailer.sent_deny_claim.subject
  #
  def sent_deny_claim email
    @greeting = "Hi"

    mail(to: email, subject: 'Turkish Deny claim mail')
  end
end
