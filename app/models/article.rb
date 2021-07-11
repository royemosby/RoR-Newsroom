class Article < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :editor_revisions
  has_many :reviewers, through: :editor_revisions, class_name: "Employee"
  has_many :article_updates, foreign_key: :article_id
  has_many :updaters, through: :article_updates, class_name: "Employee"
  has_many :article_tags
  has_many :tags, through: :article_tags

  validates :title, length: {minimum: 3}
  validate :content_length_min_ten_words

  scope :status_published, -> {where("status = ?", "published").order(:published_date).reverse_order}
  scope :drafts, -> {where.not("status = ?", "published")}
  scope :by_status, -> {Article.drafts.order(:status)}
  scope :alpha_published, -> {where("status = ?", "published").order("LOWER(title)")}

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
