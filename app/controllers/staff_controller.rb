class StaffController < ApplicationController

  def index
    @staff = Employee.all
  end

  def show
    @staff_member = Employee.find(params[:id])
  end
end
