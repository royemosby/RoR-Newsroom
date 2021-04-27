class EmployeesController < ApplicationController

  #TODO Employee actions: new, create, edit, update, destroy

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find_by(id: params[:id])
  end
end
