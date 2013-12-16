class Employee < ActiveRecord::Base
  has_many :sales

  def self.return_employee_names_and_ids
    output = []
    self.all.each do |employee|
      output << [employee.full_name,employee.id]
    end
    output
  end
end
