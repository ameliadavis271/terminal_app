require 'tty-prompt'
require 'colorize'
require 'json'

class User
  # attr_reader :name, :gender, :age, :height, :weight

  # def initialize(name, gender, age, height, weight)
  #   @name = name
  #   @gender = gender
  #   @age = age.to_i
  #   @height = height.to_i
  #   @weight = weight.to_i
  # end

  # def to_a
  #   [@name, @gender, @age, @height, @weight]
  # end

  # def self.user_input
  #   user = {}
  #   INPUTS.each do |input|
  #     puts "What's your #{input}?"
  #     print "> "
  #     user[input] = gets.chomp
  #   end
  #   user
  # end

  # BELOW NOT CORRECT, JUST A BASE TO EDIT OFF OF

  # def read_users
  #   user = File.read(user_input)
  #   JSON.parse(data).map do |user|
  #     User.new(
  #       name,
  #       gender,
  #       age,
  #       height,
  #       weight,
  #     )
  #   end
  # end

  # def write_users
  #   user = @Users.map do |user|
  #     {
  #       name: name,
  #       gender: gender,
  #       age: age,
  #       height: height,
  #       weight: weight
  #     }
  #   end
  #   File.write(user_input, JSON.pretty_generate(user))
  # end

  # def create_user(user input)
  #   user = user_input
  #   @Users << User.new(
  #     @Users.length + 1,
  #     name,
  #     gender,
  #     age,
  #     height,
  #     weight,
  #   )
  # end
end
