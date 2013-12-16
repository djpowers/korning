class SalesController < ApplicationController

  helper_method :employees_dropdown_list
  helper_method :customers_dropdown_list
  helper_method :products_dropdown_list

  def index
    @sales = Sale.all
    @sales_last_12_months = Sale.sales_last_12_months
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to sales_path, notice: 'Sale was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:sale_date, :sale_amount, :units_sold, :invoice_no, :invoice_frequency, :employee_id, :customer_id, :product_id)
  end

  def employees_dropdown_list
    @employee_dropdowm_list ||= Employee.return_employee_names_and_ids
  end

  def customers_dropdown_list
    @customers_dropdown_list ||= Customer.return_customer_names_and_ids
  end

  def products_dropdown_list
    @products_dropdown_list ||= Product.return_product_names_and_ids
  end

end
