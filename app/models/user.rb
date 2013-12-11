require "bcrypt"

class User < ActiveRecord::Base
  attr_accessible :email, :password, :first_name, :last_name, :birth_month, :birth_day, :birth_year, :gender
  attr_reader :password
  validates :password_digest, presence: { :message => "Password can't be blank" }
  validates :password, length: { minimum: 6 }
  validates_presence_of :email, :session_token, :first_name, :last_name, :birth_month, :birth_day, :birth_year, :gender
  validates_uniqueness_of :email

  before_validation :reset_session_token!, on: :create

  has_one(
    :profile,
    class_name: 'Profile',
    foreign_key: :user_id,
    primary_key: :id
  )


  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
  end
end
