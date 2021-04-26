class Employee < ApplicationRecord
  has_secure_password
  has_many :employee_roles
  has_many :roles, through: :employee_roles
  has_many :articles
  has_many :editor_revisions, foreign_key: :reviewer_id
  has_many :article_updates, foreign_key: :updater_id

  validates :first_name, presence: true
  validates :last_name, presence: true
end