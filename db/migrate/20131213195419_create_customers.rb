class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :account_number
      t.string :web_address
      t.string :invoice_freq

      t.timestamps
    end
  end
end
