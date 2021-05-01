module Workspace::EmployeesHelper

  def full_name(employee)
    if employee.first_name.empty?
      unless employee.gh_name.empty?
        employee.gh_name
      else
        "This person has no name"
      end
    else
      "#{employee.first_name} #{employee.last_name}"
    end
  end
  
end
