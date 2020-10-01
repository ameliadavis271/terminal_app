require 'colorize'

module Errors
  module_function

  def ask(prompt)
    input = nil
    loop do
      puts prompt 
      print '> '
      input = gets.chomp
      break if input =~ /\A-?\d+\Z/
      system('clear')
      puts "You must enter a whole numeric value when needed. Please try again!".colorize(:red)
    end
    input
  end  
end