class RemoveFrequencyColumnFromCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :invoice_freq, :string
  end
end
