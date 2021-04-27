class EmployeeRole < ApplicationRecord
  belongs_to :role
  belongs_to :employee

  #TODO need full_name helper
end