class UserMailer < ApplicationMailer
  def notify email, noti
    @body = noti.body
    mail to: email, subject: noti.title
  end
end
