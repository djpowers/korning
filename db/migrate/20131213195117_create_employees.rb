class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :email

      t.timestamps
    end
  end
end
