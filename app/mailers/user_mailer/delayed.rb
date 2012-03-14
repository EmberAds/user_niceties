class UserMailer
  class Delayed

    def self.welcome_email_for user
      Resque.enqueue(UserMailer::Delayed::WelcomeEmail, user.id)
    end

    def self.reset_email_for password_reset
      Resque.enqueue(UserMailer::Delayed::PasswordResetEmail, password_reset.id)
    end

  end
end