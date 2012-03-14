require 'spec_helper'

describe PasswordReset do
  describe "#from" do
    before :each do
      @email = "kitty@emberads.com"
      @user = a_saved User, email: @email
    end

    it "should create a password reset for an existing user with an email address" do
      password_reset = PasswordReset.from @email
      password_reset.should be_persisted
      password_reset.user_id.should be == @user.id
    end

    it "should raise an error if the email is unknown" do
      -> { password_reset = PasswordReset.from "giraffy@emberads.com" }.should raise_exception
    end

  end

  describe "#create" do

    before :each do
      Timecop.freeze 2012, 3, 14
      @email = "kitty@emberads.com"
      @user = a_saved User, email: @email
      @password_reset = PasswordReset.new
      @password_reset.user = @user
      @password_reset.save!
    end

    after :each do
      Timecop.return
    end

    it "should generate a token" do
      @password_reset.token.should_not be_nil
      @password_reset.token.should have(43).characters
    end

    it "should set the expired_at date" do
      @password_reset.expires_at.should be == Time.now + PasswordReset::DEFAULT_EXPIRY
    end

    it "should send the reset email" do
      UserMailer::Delayed::PasswordResetEmail.should have_queued(@password_reset.id)
    end
  end
end
