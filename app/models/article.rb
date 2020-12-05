class Article < ApplicationRecord

# Association
# Each article can belong to just one user
belongs_to :user

# validation
validates :title, presence: true, length: { minimum: 6, maximum: 100 }
validates :description, presence: true, length: { minimum: 10, maximum: 300 }

def to_s
  "#{self.class.name.downcase}"
end

end