class Role < ApplicationRecord
  has_many :employee_roles
  has_many :employees, through: :employee_roles
end
