class Article < ApplicationRecord

# Association
# Each article can belong to just one user
belongs_to :user
# Each article has many categories, through the article categories table
has_many :article_categories
has_many :categories, through: :article_categories

# validation
validates :title, presence: true, length: { minimum: 6, maximum: 100 }
validates :description, presence: true, length: { minimum: 10, maximum: 300 }

def to_s
  "#{self.class.name.downcase}"
end

end