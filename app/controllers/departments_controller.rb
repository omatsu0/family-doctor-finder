class DepartmentsController < ApplicationController
  def show
    @department = Department.find(params[:id])

  end

  def index
    @departments = Department.all
  end
end
