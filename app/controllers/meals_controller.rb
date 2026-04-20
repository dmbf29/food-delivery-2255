require_relative '../views/meal_view.rb'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def list
    # get all the meals from the repository
    meals = @meal_repository.all
    # ask the view to display the meals
    @meal_view.display(meals)
  end

  def add
    # name = ask the user what is the name of the meal
    name = @meal_view.ask_for('name')
    # price = ask the user what is the price of the meal
    price = @meal_view.ask_for('price').to_i
    # make a meal
    meal = Meal.new(name: name, price: price)
    # ask the repository to save the meal
    @meal_repository.create(meal)
  end
end