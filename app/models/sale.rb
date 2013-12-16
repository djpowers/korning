class Sale < ActiveRecord::Base
  validates_presence_of :sale_date, :sale_amount, :units_sold, :invoice_no, :invoice_frequency, :employee, :customer, :product
  belongs_to :employee
  belongs_to :customer
  belongs_to :product
  validates_numericality_of :sale_amount
  validates_numericality_of :units_sold, :only_integer => true
  validates_inclusion_of :invoice_frequency, {in: %w(Monthly Quarterly Once)}
  validates_format_of :invoice_no, with: /[a-zA-Z]|\d/

  def self.sales_last_12_months
    Sale.where("sale_date >= ?", 12.months.ago)
  end

end
