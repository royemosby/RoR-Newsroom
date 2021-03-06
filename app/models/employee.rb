class Employee < ApplicationRecord
  has_secure_password
  has_many :employee_roles
  has_many :roles, through: :employee_roles
  has_many :articles
  has_many :editor_revisions, foreign_key: :reviewer_id
  has_many :article_updates, foreign_key: :updater_id

  validates :username, presence: true
  validates :username, uniqueness: true

  def published_articles
    self.articles.filter do |a|
      a.status == "published"
    end
  end

  def drafts
    self.articles.filter do |a|
      a.status != "published"
    end
  end
end