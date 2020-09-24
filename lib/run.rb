require "tty-prompt"
require "colorize"

prompt = TTY::Prompt.new

require_relative 'menu'
require_relative 'user'
require_relative 'calories'


puts "Please enter your name"
print "> "
name = gets.chomp
puts "Please enter your gender (male/female)"
print "> "
gender = gets.chomp
puts "Please enter your gender age"
print "> "
age = gets.chomp.to_i
puts "Please enter your height in cms"
print "> "
height = gets.chomp.to_i
puts "Please enter your weight in kgs"
print "> "
weight = gets.chomp.to_i

menu
