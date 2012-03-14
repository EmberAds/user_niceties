class UserMailer
  class Delayed
    class WelcomeEmail
      @queue = :"accounts:internal"

      def self.perform user_id
        user = User.find(user_id)
        UserMailer.welcome_email_for(user).deliver
      end
    end
  end
end