class OrderView
  def display(orders)
    if orders.any?
      orders.each_with_index do |order, index|
        puts "#{index + 1} - #{order.meal.name} ¥#{order.meal.price}\n #{order.customer.name} - #{order.customer.address}\n Rider: #{order.employee.username}"
      end
    else
      puts "No undelivered orders"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    gets.chomp
  end
end
