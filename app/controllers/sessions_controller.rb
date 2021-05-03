require "securerandom"

class SessionsController < ApplicationController

  def new
    if session[:employee_id]
      @employee = Employee.find_by(id: session[:employee_id])
      redirect_to workspace_employee_path(@employee), notice: "You are already logged on."
    else
      @employee = Employee.new
    end
  end

  def create
    if params.has_key? :username
      if @employee = Employee.find_by(username: params[:username])
        if @employee.authenticate(params[:password])
          session[:employee_id] = @employee.id
          redirect_to workspace_employee_path(@employee), success: "Welcome, #{@employee.first_name}"
        else
          redirect_to "/login", alert: "Username and password did not match."
        end
      else
        redirect_to"/login", alert: "Username and password did not match."
      end
    else
      #if params[:username] does not exist, assume GH login
      @employee = Employee.find_or_create_by(gh_uid: auth['uid']) do |e|
        e.username = auth['info']['nickname']
        e.gh_email = auth['info']['email']
        e.password = SecureRandom.base64(12)
      end
      session[:employee_id] = @employee.id
      if @employee.first_name.nil? || @employee.last_name.nil?
        redirect_to edit_workspace_employee_path(@employee), notice: "Please complete your account registration form"
      else
        redirect_to workspace_employee_path(@employee), success: "Welcome, #{@employee.first_name}"
      end
    end

  end

  def destroy
    if session[:employee_id]
      session.delete :employee_id
      redirect_to "/", notice: "Successfully logged out."
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def current_user
    @employee = Employee.find_by(id: session[employee_id])
  end

  def logged_on
    unless current_user
      redirect_to "/"
    end
  end

end
