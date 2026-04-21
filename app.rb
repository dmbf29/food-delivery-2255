require_relative "app/models/meal"
require_relative "app/models/customer"
require_relative 'router'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'

meal_csv_file = File.join(__dir__, "data/meals.csv")
meal_repository = MealRepository.new(meal_csv_file)
meals_controller = MealsController.new(meal_repository)
customer_csv_file = File.join(__dir__, "data/customers.csv")
customer_repository = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repository)

employee_csv_file = File.join(__dir__, "data/employees.csv")
employee_repository = EmployeeRepository.new(employee_csv_file)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run
