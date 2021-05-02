class Tag < ApplicationRecord
  has_many :article_tags
  has_many :articles, through: :article_tags
  validates :tag, presence: true
  validates :tag, uniqueness: true
  validate :cannot_contain_spaces

  def cannot_contain_spaces
    if tag.present?
      if tag.index(/\s/)
        errors.add(:tag, "Tags must be single words and cannot contain spaces.")
      end
    else
      errors.add(:tag, "Cannot create an empy tag")
    end
  end

  def published_articles
    articles.filter { |a| a.status == "published"}
  end
end
