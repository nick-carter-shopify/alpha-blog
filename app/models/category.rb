class Category < ApplicationRecord

  # Each article has many categories, through the article categories table
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name, presence: true, length: { minimum: 3, maximum: 18 }, uniqueness: { case_sensitive: false }

end