require_relative '../views/customer_view.rb'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    # get all the customers from the repository
    customers = @customer_repository.all
    # ask the view to display the customers
    @customer_view.display(customers)
  end

  def add
    # name = ask the user what is the name of the customer
    name = @customer_view.ask_for('name')
    # address = ask the user what is the address of the customer
    address = @customer_view.ask_for('address')
    # make a customer
    customer = Customer.new(name: name, address: address)
    # ask the repository to save the customer
    @customer_repository.create(customer)
  end
end
