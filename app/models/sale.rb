class Sale < ActiveRecord::Base

  def self.sales_last_12_months
    Sale.where("sale_date >= ?", 12.months.ago)
  end

end
