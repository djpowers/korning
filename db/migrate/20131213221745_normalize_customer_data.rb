class NormalizeCustomerData < ActiveRecord::Migration

  def up
    add_column :sales, :customer_id, :integer

    Sale.find_each do |sale|
      customer_info = sale.customer_and_account_no.split(' (')
      customer = Customer.find_or_initialize_by(name: customer_info[0])
      customer.name = customer_info[0]
      customer.account_number = customer_info[1].chop
      customer.web_address = 'http://' + customer_info[0].downcase + '.com'
      customer.save
      sale.customer_id = customer.id
      sale.save
    end

    remove_column :sales, :customer_and_account_no
  end

  def down
    add_column :sales, :customer_and_account_no, :string

    Sale.find_each do |sale|
      customer = Customer.find_by(id: sale.customer_id)
      customer_info = customer.name + ' (' + customer.account_number + ')'
      sale.customer_and_account_no = customer_info
      sale.save
    end

    Customer.delete_all

    remove_column :sales, :customer_id
  end
end
