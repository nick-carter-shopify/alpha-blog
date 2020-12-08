class Category < ApplicationRecord

  validates :name, presence: true, length: { minimum: 3, maximum: 18 }, uniqueness: { case_sensitive: false }

end