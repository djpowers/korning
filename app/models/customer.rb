class Customer < ActiveRecord::Base
  has_many :sales

  def self.return_customer_names_and_ids
    output = []
    self.all.each do |customer|
      output << [customer.name,customer.id]
    end
    output
  end
end
