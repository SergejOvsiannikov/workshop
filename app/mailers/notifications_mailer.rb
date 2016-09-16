class NotificationsMailer < ApplicationMailer
  def notify_user(user)
    @user = user
    mail(to: user.email, subject: 'Your promocode for whore!')
  end
end
