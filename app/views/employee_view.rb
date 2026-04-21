class EmployeeView
  def display(employees)
    if employees.any?
      employees.each_with_index do |employee, index|
        puts "#{index + 1} - #{employee.username} - #{employee.role}"
      end
    else
      puts "No undelivered employee"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    gets.chomp
  end
end
