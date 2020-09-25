require 'tty-prompt'
require 'colorize'
require 'json'

module User
  def self.create_new_user
    user = {}
    puts 'Please enter your name'
    print '> '
    name = gets.chomp
    user[:name] = name
    puts 'Please enter your gender (male/female)'
    print '> '
    gender = gets.chomp
    user[:gender] = gender
    puts 'Please enter your age'
    print '> '
    age = gets.chomp.to_i
    user[:age] = age
    puts 'Please enter your height in cms'
    print '> '
    height = gets.chomp.to_i
    user[:height] = height
    puts 'Please enter your weight in kgs'
    print '> '
    weight = gets.chomp.to_i
    user[:weight] = weight
    user
  end
end
