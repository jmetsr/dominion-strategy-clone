require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: {minimum: 5, allow_nil: true}
  
  after_initialize do |user|
      user.set_session_token
  end
  
  def set_session_token
    self.session_token ||= generate_session_token
  end
  def generate_session_token
    return SecureRandom.urlsafe_base64
  end
  def password
    @password
  end
  def password=(password)
    psword = Password.create(password)
    self.password_digest = psword
    @password = password
  end
  def is_password?(password)
    Password.new(self.password_digest) == password
  end
  def self.find_by_credentials(username,password)
    user = User.find_by_username(username)
    if user && user.is_password?(passsword)
      return user;
    else
      return nil
    end    
  end
  def reset_session_token
    self.set_session_token = generate_session_token
    self.save
  end
end