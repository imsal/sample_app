class User < ApplicationRecord
  has_secure_password # checks for presence of password (can be whitespace though)

  before_save { self.email = email.downcase }
  # Alternates
  # before_save {self.email = self.email.downcase }
  # before_save { email.downcase! }

  validates(:name, presence: true, length: { maximum: 50 })

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates(:email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false })

  validates(:password, presence: true, length: { minimum: 5 } )

  # presence: true checks for .blank? NOT --> .empty?
end