class Workspace::EmployeesController < ApplicationController

  #TODO Employee actions: new, create, edit, update, destroy

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find_by(id: params[:id])
  end

  def edit
    #TODO edit employee only if self
    @employee = Employee.find_by(id: params[:id])
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    
  end

end
