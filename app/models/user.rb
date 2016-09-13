class User < ActiveRecord::Base

  validates :username, presence: true, length: {minimum: 3}
  validates :password_digest, :session_token, presence: true

  after_initialize :ensure_session_token

  has_and_belongs_to_many :checklists

  has_many(
      :authored_checklists,
      class_name: Checklist,
      foreign_key: :author_id,
      primary_key: :id
  )

  def self.find_by_credentials(username, password)
    user = self.find_by_username(username)
    return user && valid_password?(password) ? user : nil
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def can_delete?(resource)
    resource.can_be_deleted_by?(self)
  end
end
