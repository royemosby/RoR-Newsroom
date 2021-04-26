class Tag < ApplicationRecord
  has_many :article_tags
  has_many :tags, through: :articles
end
