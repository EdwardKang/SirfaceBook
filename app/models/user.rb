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

  has_many(
    :posts,
    class_name: "Post",
    foreign_key: :sender_id,
    primary_key: :id
  )

  has_many(
    :received_posts,
    class_name: "Post",
    foreign_key: :receiver_id,
    primary_key: :id
  )

  has_many(
    :messages,
    class_name: "Message",
    foreign_key: :sender_id,
    primary_key: :receiver_id
  )

  has_many(
    :received_messages,
    class_name: "Message",
    foreign_key: :receiver_id,
    primary_key: :id
  )

  has_many(
    :initiated_friendships,
    class_name: "Friendship",
    foreign_key: :friender_id,
    primary_key: :id
  )

  has_many(
    :received_friendships,
    class_name: "Friendship",
    foreign_key: :friendee_id,
    primary_key: :id
  )

  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :photos,
    class_name: "Photo",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :received_friends, through: :received_friendships, source: :friender
  has_many :initiated_friends, through: :initiated_friendships, source: :friendee

  def profile_photo
    self.photos.where(is_profile_pic: true)[0]
  end

  def friends
    friends = []
    self.received_friends.each do |friend|
      friends << friend unless friend.initiated_friendships.where(is_pending: false, friendee_id: self.id).empty?
    end


    self.initiated_friends.each do |friend|
      friends << friend unless friend.received_friendships.where(is_pending: false, friender_id: self.id).empty?
    end

    friends
  end

  def friends_ids
    friend_ids = [self.id]
    self.friends.each do |friend|
      friend_ids << friend.id
    end

    friend_ids
  end

  def pending_received_friends
    pending_friends = []
    self.pending_received_friend_requests.each do |friendship|
      pending_friends << User.find(friendship.friender_id)
    end

    pending_friends
  end

  def user_requests
    self.initiated_friendships.where(is_pending: false) + self.received_friendships.where(is_pending: false)
  end

  def pending_initiated_friend_requests
    self.initiated_friendships.where(is_pending: true)
  end

  def pending_received_friend_requests
    self.received_friendships.where(is_pending: true)
  end


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
