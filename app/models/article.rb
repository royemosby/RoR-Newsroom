class Article < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :article_revisions
  
end
