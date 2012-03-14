class UserMailer < ActionMailer::Base
  default from: "emby@emberads.com"
  layout 'email'

  # sends the welcome email
  def welcome_email_for user
    @user = user
    mail to: user.email, subject: "Welcome to EmberAds"
  end

  # send the reset password email
  def reset_email_for password_reset
    @password_reset = password_reset
    mail to: password_reset.user.email, subject: "Password reset instructions for EmberAds"
  end
end
