class NormalizeProductData < ActiveRecord::Migration

  def up
    add_column :sales, :product_id, :integer

    Sale.find_each do |sale|
      product = Product.find_or_create_by(name: sale.product_name)
      sale.product_id = product.id
      sale.save
    end

    remove_column :sales, :product_name
  end

  def down
    add_column :sales, :product_name, :string

    Sale.find_each do |sale|
      product = Product.find_by(id: sale.product_id)
      sale.product_name = product.name
      sale.save
    end

    Product.delete_all

    remove_column :sales, :product_id

  end

end
