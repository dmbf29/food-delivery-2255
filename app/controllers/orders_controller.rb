require_relative '../views/order_view'
require_relative '../views/employee_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @order_view = OrderView.new
    @meal_view = MealView.new
    @customer_view = CustomerView.new
    @employee_view = EmployeeView.new
  end

  def add
    # get the meals from the repo
    meals = @meal_repository.all
    # give them to the view
    @meal_view.display(meals)
    # ask the user for the index
    index = @meal_view.ask_for('number').to_i - 1
    meal = meals[index]

    # get the customers from the repo
    customers = @customer_repository.all
    # give them to the view
    @customer_view.display(customers)
    # ask the user for the index
    index = @customer_view.ask_for('number').to_i - 1
    customer = customers[index]

    # get the customers from the repo
    employees = @employee_repository.all_riders
    # give them to the view
    @employee_view.display(employees)
    # ask the user for the index
    index = @employee_view.ask_for('number').to_i - 1
    employee = employees[index]

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered
    # get the order from the repository
    orders = @order_repository.undelivered_orders
    # give the orders to the view for display
    @order_view.display(orders)
  end

  def list_my_undelivered(employee)
    # need things
    orders = @order_repository.my_undelivered_orders(employee)
    # give to view
    @order_view.display(orders)
  end

  def mark_as_delivered(employee)
    # need things
    orders = @order_repository.my_undelivered_orders(employee)
    # give to view
    @order_view.display(orders)
    index = @order_view.ask_for('number').to_i - 1
    order = orders[index]
    @order_repository.mark_as_delivered(order)
  end
end
