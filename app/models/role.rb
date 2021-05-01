class Role < ApplicationRecord
  has_many :employee_roles
  has_many :employees, through: :employee_roles

  validates :role, presence: true
  validates :role, uniqueness: true

  # TODO return employees by role
end
