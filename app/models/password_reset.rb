require 'securerandom'

class PasswordReset < ActiveRecord::Base

  DEFAULT_EXPIRY = 1.day

  belongs_to :user

  before_create :generate_token
  before_create :set_expires_at
  after_create :send_reset_email

  scope :expired, -> { where("expires_at < ?", Time.now) }
  scope :unexpired, -> { where("expires_at > ?", Time.now) }

  validates :user_id, presence: true

  def self.from email
    user = User.where(email: email).first
    password_reset = PasswordReset.new
    password_reset.user = user
    password_reset.save!
    password_reset
  end

  def to_param
    "#{token}"
  end

  protected

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64(32)
  end

  def set_expires_at
    self.expires_at ||= Time.now + DEFAULT_EXPIRY
  end

  def send_reset_email
    UserMailer::Delayed.reset_email_for(self)
  end

end
