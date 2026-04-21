require_relative '../views/session_view'
# user actions -> CRUD
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @session_view = SessionView.new
  end

  def login
    # tell the view to ask for employee username
    username = @session_view.ask_for('username')
    # tell the view to ask for employee password
    password = @session_view.ask_for('password')
    # ask the employee repo for the employee with that username
    employee = @employee_repository.find_by_username(username)
    # if the password is correct for that employee
    # if employee&.password == password
    if employee && employee.password == password
      # welcome the user
      @session_view.welcome(employee)
      return employee
    else
      # tell them wrong credentials
      @session_view.wrong_credentials
      login
    end
  end
end
