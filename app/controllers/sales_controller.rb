class SalesController < ApplicationController

  def index
    @sales = Sale.all
    @sales_last_12_months = Sale.sales_last_12_months
  end

  def show
    @sale = Sale.find(params[:id])
  end

end
