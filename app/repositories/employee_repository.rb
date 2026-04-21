require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(filepath)
    @filepath = filepath
    @employees = [] # array of employee instances
    load_csv if File.exist?(@filepath)
  end

  def find_by_username(username)
    @employees.find do |employee|
      employee.username == username
    end
  end

  def find(id)
    # searching for the employee that match the id given to it
    @employees.find do |employee|
      employee.id == id
    end
  end

  def all_riders
    @employees.select do |employee|
      employee.rider?
    end
  end

  # CRUD


  private

  def load_csv
    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      # convert the data from the csv file to proper format
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end
