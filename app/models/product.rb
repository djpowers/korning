class Product < ActiveRecord::Base
  has_many :sales

  def self.return_product_names_and_ids
    output = []
    self.all.each do |product|
      output << [product.name,product.id]
    end
    output
  end
end
