class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password
  
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank"}
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  after_initialize :ensure_session_token
  
  before_validation :ensure_session_token
  
  # attr_accessible :password_digest, :username
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user.is_password?(password) ? user : nil
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end
  
  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
