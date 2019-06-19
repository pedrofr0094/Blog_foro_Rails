class User < ApplicationRecord
  has_many :article
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  before_save { self.email = email.downcase }

  def self.search(search)
    where("username LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%")
  end
end
