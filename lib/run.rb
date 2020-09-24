require "tty-prompt"
require "colorize"

prompt = TTY::Prompt.new

require_relative 'menu'
require_relative 'user'
require_relative 'calories'

class Run

  attr_reader :name, :gender, :age, :height, :weight

  def initialize
    @name = name
    @gender = gender
    @age = age
    @height = height
    @weight = weight
  end

  def to_a
    [@name, @gender, @age, @height, @weight]
  end
end


puts "Please enter your name"
print "> "
name = gets.chomp
puts "Please enter your gender (male/female)"
print "> "
gender = gets.chomp
puts "Please enter your age"
print "> "
age = gets.chomp.to_i
puts "Please enter your height in cms"
print "> "
height = gets.chomp.to_i
puts "Please enter your weight in kgs"
print "> "
weight = gets.chomp.to_i


menu