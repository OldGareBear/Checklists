class User < ActiveRecord::Base
  validates :username, presence: true, length: {minimum: 3}
  validates :password_digest, :session_token, presence: true

  after_initialize :ensure_session_token

  has_and_belongs_to_many :checklists

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token || reset_token!
  end
end
