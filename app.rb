require_relative "app/models/meal"
require_relative "app/models/customer"
require_relative 'router'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'


# burger = Meal.new(name: "Burger", price: 1000)

meal_csv_file = File.join(__dir__, "data/meals.csv")
meal_repository = MealRepository.new(meal_csv_file)
meals_controller = MealsController.new(meal_repository)
customer_csv_file = File.join(__dir__, "data/customers.csv")
customer_repository = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)

router.run

# meal_repository.create(burger)
# p meal_repository