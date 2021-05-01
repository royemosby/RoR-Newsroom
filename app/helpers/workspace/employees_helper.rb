module Workspace::EmployeesHelper

  def full_name(employee)
    if employee.first_name.nil? || employee.first_name.empty?
      "This person has no set no first or last name"
    else
      "#{employee.first_name} #{employee.last_name}"
    end
  end
  
end
