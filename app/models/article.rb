class Article < ApplicationRecord
  belongs_to :employee, optional: true
  has_many :editor_revisions
  has_many :reviewers, through: :editor_revisions, class_name: "Employee"
  has_many :article_updates
  has_many :updaters, through: :article_updates, class_name: "Employee"
  has_many :article_tags
  has_many :tags, through: :article_tags
end
