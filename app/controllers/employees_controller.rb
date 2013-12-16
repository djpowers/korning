class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    @sales_history = Sale.where("employee_id = #{@employee.id}").order("sale_amount DESC")
  end

end
