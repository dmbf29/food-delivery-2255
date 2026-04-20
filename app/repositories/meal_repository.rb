require 'csv'

class MealRepository
  def initialize(filepath)
    @filepath = filepath
    @meals = [] # array of MEAL instances
    @next_id = 1
    load_csv if File.exist?(@filepath)
  end

  def all
    @meals
  end

  def create(meal)
    # the repo takes care of assigning the id
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@filepath, headers: :first_row, header_converters: :symbol) do |row|
      # convert the data from the csv file to proper format
      # p row
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      # p row
      @meals << Meal.new(row)
    end
    # repo takes care of incrementing the id
    @next_id = @meals.last.id + 1 if @meals.any?
  end

  def save_csv
    CSV.open(@filepath, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
