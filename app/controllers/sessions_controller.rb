class SessionsController < ApplicationController

  def new
    if session[:employee_id]
      @employee = Employee.find_by(id: session[:employee_id])
      redirect_to employee_path(@employee), alert: "You are already logged on."
    end
  end

  def create
    @employee = Employee.find_or_create_by(gh_uid: auth['uid']) do |e|
      e.gh_name = auth['info']['name']
      e.gh_email = auth['info']['email']
      e.password = ENV['OAUTH_USER_PASS'] #TODO balance has_secure_password w/omniauth requirement
    end
    session[:employee_id] = @employee.id
    if @employee.first_name.nil? || @employee.last_name.nil
      redirect_to edit_employee_path(@employee), alert: "Please complete your account registration form"
    else
      redirect_to employee_path(@employee), alert: "Welcome, #{@employee.first_name}"
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
