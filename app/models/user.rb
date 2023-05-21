class User < ApplicationRecord
  attr_accessor :password, :password_confirmation

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_save :encrypt_password

  def encrypt_password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(entered_password)
    BCrypt::Password.new(password_digest) == entered_password
  end
end
