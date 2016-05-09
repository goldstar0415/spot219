class Notification < ActiveRecord::Base
  belongs_to :city
  after_create :send_mail

  private ##
  def send_mail
    users.each do |user|
      UserMailer.delay.notify(user.email, self)
    end
  end

  def users
    city.present? ? city.users : User.all
  end
end
