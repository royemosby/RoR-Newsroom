class Workspace::EmployeesController < ApplicationController

  #TODO Employee actions: new, create, update, destroy
  before_action :find_employee, only: [:show, :edit, :update]
  before_action :logged_on

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find_by(id: params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to workspace_employee_path(@employee), alert: "Account created."
    else
      render new_workspace_employee, alert: "Account not created. Fix errrors below."
    end
  end

  def edit
    if session[:employee_id] != params[:id].to_i
      redirect_to workspace_employees_path, alert: "You do not have permission to edit that account."
    end
  end

  #TODO Allow for password changes while logged in (OAuth accts have fake)
  def update
    if params[:id] == session[:employee_id].to_s
      @employee.update(employee_params)
      if @employee.save
        redirect_to workspace_employee_path(@employee), success: "Your account has been updated."
      else
        render edit, alert: "Your updates were not saved. See form below for more."
      end
    else
      redirect_to workspace_employees_path, alert: "You do not have permission to edit that account."
    end
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :password, :title, :gh_name, :gh_email)
  end

  

end
