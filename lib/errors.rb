module Errors
  module_function

  def name_error
    user = UserData.new
    puts 'Please enter your name'
    print '> '
    name = gets.strip.downcase
    raise ArgumentError, "Name must not be empty" if name.empty?
    user.name = name
  end
end