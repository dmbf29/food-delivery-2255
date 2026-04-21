class Router

  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      # have the user login
      @employee = @sessions_controller.login
      while @employee # this instance came back form the sessions controller
        if @employee.manager?
          choice = display_manager_menu
          print `clear`
          manager_action(choice)
        else
          choice = display_rider_menu
          print `clear`
          rider_action(choice)
        end
      end
    end
  end

  private

  def display_manager_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "3 - List all the customers"
    puts "4 - Add a new customer"
    puts "5 - List undelivered orders"
    puts "6 - Add a new order"
    puts "9 - Log out"
    puts "0 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def display_rider_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all my undelivered orders"
    puts "2 - Mark one of my orders as delivered"
    puts "9 - Log out"
    puts "0 - Quit"
    print "> "
    gets.chomp.to_i
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered
    when 6 then @orders_controller.add
    when 9 then logout
    when 0 then quit
    else
      puts "Try again..."
    end
  end

  def rider_action(choice)
    case choice
    when 1 then @orders_controller.list_my_undelivered(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 9 then logout
    when 0 then quit
    else
      puts "Try again..."
    end
  end

  def logout
    @employee = nil
  end

  def quit
    logout
    @running = false
  end
end
