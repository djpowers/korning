class NormalizeEmployeeData < ActiveRecord::Migration
  def up
    add_column :sales, :employee_id, :integer

    Sale.find_each do |sale|

      employee_info = sale.employee.split(' (')
      employee = Employee.find_or_initialize_by(full_name: employee_info[0])
      employee.full_name = employee_info[0]
      employee.email = employee_info[1].chop
      employee.save
      sale.employee_id = employee.id
      sale.save
    end

    remove_column :sales, :employee
  end

  def down
    add_column :sales, :employee, :string

    Sale.find_each do |sale|
      employee = Employee.find_by(id: sale.employee_id)
      employee_info = employee.full_name + " (" + employee.email + ")"
      sale.employee = employee_info
      sale.save
    end

    Employee.delete_all

    remove_column :sales, :employee_id
  end
end
