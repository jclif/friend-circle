class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: {message: "Password can't be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}

  before_validation :ensure_session_token

  has_many(
    :friend_elipses,
    class_name: "FriendElipse",
    foreign_key: :stalker_id,
    primary_key: :id
  )

  has_many :memberships, through: :friend_elipses, source: :memberships
  has_many :victims, through: :memberships, source: :victim

  def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)

    return @user if !@user.nil? && @user.is_password?(password)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_password
    pwd = SecureRandom::urlsafe_base64(6)
    self.password = pwd
    pwd
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end