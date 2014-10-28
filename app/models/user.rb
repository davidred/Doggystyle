# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  gender          :integer          not null
#  breed           :integer          not null
#  email           :string(255)      not null
#  country         :string(255)      not null
#  zip             :integer          not null
#

class User < ActiveRecord::Base

  attr_reader :password

  validates :username, :password_digest, :gender, :breed, :email, :country, :zip, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  def self.find_by_credentials(creds)
    user = User.find_by_username(creds[:username])
    if user
      user.isPassword?(creds[:password]) ? user : nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def isPassword?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

end
