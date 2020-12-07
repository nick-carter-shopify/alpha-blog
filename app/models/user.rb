class User < ApplicationRecord
  
  # Before save method
  # downcase all email address before saving
  before_save { self.email = email.downcase }

  # Set up association - user has many articles
  # Destroy any dependents if a user is deleted
  has_many :articles, dependent: :destroy

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

  # Add secure password functionality
  has_secure_password

  def to_s
    "#{self.class.name.downcase}"
  end
     
end