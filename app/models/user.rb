class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_secure_password
  before_create :remember

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    Digest::SHA1.hexdigest(string)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token.to_s))
  end

  def authenticated?(remember_token)
    if remember_digest && remember_token
      remember_digest == User.digest(remember_token)
    else
      false
    end
  end

end
