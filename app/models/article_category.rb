class ArticleCategory < ApplicationRecord

# Article category belongs to both article and category
belongs_to :article
belongs_to :category 

end