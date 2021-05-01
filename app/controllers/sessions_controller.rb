class SessionsController < ApplicationController

  def new
    if session[:employee_id]
      @employee = Employee.find_by(id: session[:employee_id])
      redirect_to workspace_employee_path(@employee), alert: "You are already logged on."
    end
  end

  #TODO create username/password option
  #strong params for create action
  def create
  
    @employee = Employee.find_or_create_by(gh_uid: auth['uid']) do |e|
      e.gh_name = auth['info']['name']
      e.gh_email = auth['info']['email']
      e.password = ENV['OAUTH_USER_PASS'] #TODO change to secure_random
    end
    session[:employee_id] = @employee.id
    if @employee.first_name.nil? || @employee.last_name.nil?
      redirect_to edit_workspace_employee_path(@employee), alert: "Please complete your account registration form"
    else
      redirect_to workspace_employee_path(@employee), alert: "Welcome, #{@employee.first_name}"
    end
  end

  def destroy
    if session[:employee_id]
      session.delete :employee_id
      redirect_to "/"
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
