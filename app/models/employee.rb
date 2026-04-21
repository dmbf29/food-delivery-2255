class Employee
  attr_accessor :id
  attr_reader :username, :role, :password

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @username = attributes[:username] # string
    @password = attributes[:password] # string
    @role = attributes[:role] # string
  end

  # employee.manager?
  def manager?
    @role == 'manager'
  end

  def rider?
    !manager?
  end
end
