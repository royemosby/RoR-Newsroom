class Employee < ApplicationRecord
  has_secure_password
  has_many :employee_roles
  has_many :roles, through: :employee_roles
  has_many :articles
  has_many :article_revisions, foreign_key: :reviewer_id
end