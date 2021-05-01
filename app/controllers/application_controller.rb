class ApplicationController < ActionController::Base

  add_flash_types :success
  
  def current_user
    @employee = Employee.find_by(id: session[:employee_id])
  end

  def logged_on
    unless current_user
      redirect_to "/", alert: "You have to be logged in to access that page."
    end
  end
end
