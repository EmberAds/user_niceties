require "spec_helper"

describe UserMailer do

  describe "Welcome email" do
    before(:all) do
      @user = a_saved User, :email => "kitty@emberads.com", :name => "John Doe"
      @email = UserMailer.welcome_email_for(@user)
    end

    it "should be set to be delivered to the email for the user passed in" do
      @email.should deliver_to("kitty@emberads.com")
    end

    it "should be set to be delivered from our emby account" do
      @email.should deliver_from("emby@emberads.com")
    end

    it "should contain the user's name in the mail body" do
      @email.should have_body_text(/John Doe/)
    end

    it "should have the correct subject" do
      @email.should have_subject(/Welcome to EmberAds/)
    end
  end

  describe "Password reset email" do
    before :each do
      @email = "kitty@emberads.com"
      @user = a_saved User, :email => @email, :name => "John Doe"
      @password_reset = PasswordReset.from @email
      @mail = UserMailer.reset_email_for @password_reset
    end

    it "should be set to be delivered to the email for the user attached to the password reset record" do
      @mail.should deliver_to(@email)
    end

    it "should be set to be delivered from our emby account" do
      @mail.should deliver_from("emby@emberads.com")
    end

    it "should contain the user's name in the mail body" do
      @mail.should have_body_text(/John Doe/)
    end

    it "should contain the reset url in the mail body" do
      @mail.should have_body_text("/password_resets/#{@password_reset.token}")
    end

    it "should have the correct subject" do
      @mail.should have_subject(/Password reset instructions for EmberAds/)
    end

  end

end
