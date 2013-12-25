class Employee < ActiveRecord::Base
  has_many :sales

  def self.return_employee_names_and_ids
    output = []
    self.all.each do |employee|
      output << [employee.full_name,employee.id]
    end
    output
  end
  
  def monthly_sales
    monthly_sales_totals = {}
    sales.each do |sale|
      sale_month = sale.sale_date.month.to_s
      if !(monthly_sales_totals.has_key?(sale_month))
        monthly_sales_totals[sale_month] = 0.0
      end
      monthly_sales_totals[sale_month] += sale.sale_amount.to_f
    end
    monthly_sales_totals.values
  end
end
