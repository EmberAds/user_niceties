class UserMailer
  class Delayed
    class PasswordResetEmail
      @queue = :"accounts:internal"

      def self.perform password_reset_id
        password_reset = PasswordReset.find(password_reset_id)
        UserMailer.reset_email_for(password_reset).deliver
      end
    end
  end
end