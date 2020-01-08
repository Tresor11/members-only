# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  attr_accessor :remember_token
  before_create :generate_token, :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.digest(string)
    Digest::SHA1.hexdigest string
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(_remember_token)
    Digest::SHA1.hexdigest remember_digest
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private

  def generate_token
    self.remember_digest = User.digest(User.new_token)
  end

  def downcase_email
    self.email = email.downcase
  end
end
