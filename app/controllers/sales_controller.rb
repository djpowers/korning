class SalesController < ApplicationController

  def index
    @sales = Sale.all
    @sales_last_12_months = Sale.sales_last_12_months
  end

  def new
    @sale = Sale.new
    @employees_dropdown_list = Employee.return_employee_names_and_ids
    @customers_dropdown_list = Customer.return_customer_names_and_ids
    @products_dropdown_list = Product.return_product_names_and_ids
  end

  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sale }
      else
        format.html { render action: 'new' }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def sale_params
    params.require(:sale).permit(:sale_date, :sale_amount, :units_sold, :invoice_no, :invoice_frequency, :employee_id, :customer_id, :product_id)
  end

end
