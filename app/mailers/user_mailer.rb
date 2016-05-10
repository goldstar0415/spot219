class UserMailer < ApplicationMailer
  default from: 'noreply@turkishspot.com'

  def notify email, noti
    @body = noti.body
    mail to: email, subject: noti.title
  end
end
