class StaffController < ApplicationController

  def index
    @staff = Employee.all
  end

  def show
    #byebug
    @staff_member = Employee.find(params[:id])
  end
end
