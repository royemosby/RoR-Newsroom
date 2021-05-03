class Role < ApplicationRecord
  #leaving in for future app expansion using employee authorizations
  has_many :employee_roles
  has_many :employees, through: :employee_roles

  validates :role, presence: true
  validates :role, uniqueness: true

end
