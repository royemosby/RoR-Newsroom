class EmployeeRole < ApplicationRecord
  belongs_to :role
  belongs_to :employee
end