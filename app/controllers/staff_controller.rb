class StaffController < ApplicationController

  def index
    @staff = Employee.all
  end

  def show
    @staff_member = Employee.find_by(params[:id])
  end
end
