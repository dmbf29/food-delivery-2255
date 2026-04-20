class MealView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} - ¥#{meal.price}"
    end
  end

  # def ask_for_name
  #   puts "What's the name?"
  #   gets.chomp
  # end

  # def ask_for_price
  #   puts "What's the price?"
  #   gets.chomp
  # end

  def ask_for(thing)
    puts "What's the #{thing}?"
    gets.chomp
  end
end
