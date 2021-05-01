class Article < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :editor_revisions
  has_many :reviewers, through: :editor_revisions, class_name: "Employee"
  has_many :article_updates, foreign_key: :article_id
  has_many :updaters, through: :article_updates, class_name: "Employee"
  has_many :article_tags
  has_many :tags, through: :article_tags

  validates :title, length: {minimum: 2}
  validate :content_length_min_ten_words

  scope :published_articles, -> {where("status IS ?", "published")}
  scope :drafts, -> {where.not("status IS ?", "published")}


  #TODO scope for published articles
  #TODO scope for non-published articles

  def content_length_min_ten_words
    if content.present?
      words = content.split(' ')
      if words.length < 10
        errors.add(:content, "Article content must be at least 10 words.")
      end
    else
      errors.add(:content, "Article content cannot be empty.")
    end
  end
end
