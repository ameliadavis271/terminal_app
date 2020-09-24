require 'tty-prompt'
require 'colorize'

prompt = TTY::Prompt.new

require_relative 'menu'
require_relative 'user'
require_relative 'calories'
require_relative 'motivation'

def help
  system('clear')
  puts "-------------------HELP-------------------"
  puts "-m        Will display a motivation quote"
  puts "user id   Will auto login as user        "
  puts "------------------------------------------"
end

if ARGV[0]
  if ARGV[0] == '-m'
    quotes
    exit
  elsif ARGV[0] == '-h' || ARGV[0] == '--help'
    help
    exit
  end
end

puts 'Please enter your name'
print '> '
name = gets.chomp
puts 'Please enter your gender (male/female)'
print '> '
gender = gets.chomp
puts 'Please enter your age'
print '> '
age = gets.chomp.to_i
puts 'Please enter your height in cms'
print '> '
height = gets.chomp.to_i
puts 'Please enter your weight in kgs'
print '> '
weight = gets.chomp.to_i

user_input = { name: name, gender: gender, age: age, height: height, weight: weight }

system('clear')
menu(user_input)
