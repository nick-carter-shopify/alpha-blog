class User < ApplicationRecord
  # validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  INVALID_EMAIL_MESSAGE = "Must be valid email address"
  
  validates :username, presence: true, 
                       length: { minimum: 3, maximum: 25 }, 
                       uniqueness: { case_senstive: false }
  validates :email, presence: true, 
                    length: { maximum: 105 }, 
                    uniqueness: { case_sensitive: false }, 
                    format: { with: VALID_EMAIL_REGEX, message: INVALID_EMAIL_MESSAGE }
end