# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  omniauthid      :string(255)
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  gender          :integer          not null
#  breed           :integer          not null
#  email           :string(255)      not null
#  country         :integer          not null
#  zip             :integer          not null
#  summary         :text
#  photo           :string(255)
#  age             :integer
#  size            :integer
#  play_style      :integer
#  energy_level    :integer
#  owner_name      :string(255)
#  owner_photo     :string(255)
#  owner_gender    :integer
#  owner_age       :integer
#

class User < ActiveRecord::Base

  attr_reader :password

  validates :username, :password_digest, :gender, :breed, :email, :country, :zip, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  has_many :preferences
  
  has_many :sent_messages,
  class_name: "Message",
  foreign_key: :from,
  primary_key: :id
  
  has_many :received_messages,
  class_name: "Message",
  foreign_key: :to,
  primary_key: :id
  
  has_many :visits,
  class_name: "Visit",
  foreign_key: :visited,
  primary_key: :id
  
  #has_many :visitors, through: :visits, source: :visitor
  
  has_many :visited,
  class_name: "Visit",
  foreign_key: :visitor,
  primary_key: :id
  
  

  BREEDS = {1 => :Corgi, 2 => :Poodle, 3 => :Husky, 4 => :Boxer}
  COUNTRIES = {1 => :USA, 2 => :Afghanistan, 3 => :Russia}
  GENDERS = {1 => :Male, 2 => :Female}
  SIZES = {1 => :Tiny, 2 => :Small, 3 => :Medium, 4 => :Large}
  PLAY_STYLES = {1 => :Chaser, 2 => :Tugger, 3 => :Wrestler, 4 => :Tackler, 5 => :"Not Sure"}
  ENERGY_LEVELS = {1 => :"Super Chill", 2 => :Tame, 3 => :"Likes to party", 4 => :"Wild Beast"}
  LOOKING_FORS = {1 => :Friendship, 2 => :"Casual Play", 3 => :"Breeding Partner"}

  def self.find_by_credentials(creds)
    user = User.find_by_username(creds[:username])
    if user
      user.isPassword?(creds[:password]) ? user : nil
    end
  end

  def self.find_by_fb_auth_hash(omniauth)
    omniauthid = omniauth['uid'] + omniauth['provider']
    user = User.find_by_omniauthid(omniauthid)
    user ? user : nil
  end

  def breeds
    BREEDS
  end

  def genders
    GENDERS
  end

  def countries
    COUNTRIES
  end

  def play_styles
    PLAY_STYLES
  end

  def sizes
    SIZES
  end

  def energy_levels
    ENERGY_LEVELS
  end

  def looking_fors
    LOOKING_FORS
  end

  def breed_name
    BREEDS[self.breed]
  end

  def gender_name
    GENDERS[self.gender]
  end

  def owner_gender_name
    GENDERS[self.owner_gender]
  end

  def country_name
    COUNTRIES[self.country]
  end

  def size_name
    SIZES[self.size]
  end

  def play_style_name
    PLAY_STYLES[self.play_style]
  end

  def energy_level_name
    ENERGY_LEVELS[self.energy_level]
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
