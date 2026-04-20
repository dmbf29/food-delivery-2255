require 'csv'

class CustomerRepository
  def initialize(filepath)
    @filepath = filepath
    @customers = [] # array of CUSTOMER instances
    @next_id = 1
    load_csv if File.exist?(@filepath)
  end

  def all
    @customers
  end

  def create(customer)
    # the repo takes care of assigning the id
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      # convert the data from the csv file to proper format
      # p row
      row[:id] = row[:id].to_i
      # p row
      @customers << Customer.new(row)
    end
    # repo takes care of incrementing the id
    @next_id = @customers.last.id + 1 if @customers.any?
  end

  def save_csv
    CSV.open(@filepath, 'wb') do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
