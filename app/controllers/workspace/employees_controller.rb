class Workspace::EmployeesController < ApplicationController

  #TODO Employee actions: new, create, update, destroy
  before_action :find_employee, only: [:show, :edit, :update]

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
    #TODO edit employee only if self
    @employee = Employee.find_by(id: params[:id])
  end

  #TODO Allow for password changes while logged in (OAuth accts have fake)
  def update
    @employee = Employee.find_by(id: params[:id])
    
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :password, :title, :gh_name, :gh_email)
  end

end
