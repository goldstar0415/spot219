class UserMailer < ApplicationMailer
  FROM_MAILER = 'trangtrinhaxinh.vn@gmail.com'
  default from: FROM_MAILER

  def notify email, noti
    @body = noti.body
    mail to: email, subject: noti.title
  end
end
