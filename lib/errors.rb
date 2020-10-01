require 'colorize'

module Errors
  module_function

  # below prevents the user from entering anything but a digit within a string
  # they can only proceed when they enter a whole numeric value eg. 120, not 120kg
  def ask(prompt)
    input = nil
    loop do
      puts prompt
      print '> '
      input = gets.chomp
      break if input =~ /\A-?\d+\Z/

      system('clear')
      puts 'You must enter a whole numeric value when needed. Please try again!'.colorize(:red)
    end
    input
  end
end
