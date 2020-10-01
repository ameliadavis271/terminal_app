require 'tty-prompt'
require 'colorize'
require 'json'
require 'byebug'

class UserData
  attr_accessor :name, :gender, :age, :height, :weight, :goals

  def to_json(_options)
    { name: name,
      gender: gender,
      age: age,
      height: height,
      weight: weight,
      goals: goals }.to_json
  end
end

module User
  module_function

  #saves data to the user file
  def save_user(user)
    File.write("#{Dir.home}/terminal_app/data/#{user.name}.json", JSON.pretty_generate(user))
  end

  # when a user name is entered, if it matches a file name it loads the contents
  # otherwise forces the user to create a new user
  def user_login
    user = gets.chomp
    if File.exist?("#{Dir.home}/terminal_app/data/#{user}.json")
      user_json = JSON.parse(File.read("#{Dir.home}/terminal_app/data/#{user}.json"))
      user = UserData.new
      user.name = user_json['name']
      user.gender = user_json['gender']
      user.age = user_json['age']
      user.height = user_json['height']
      user.weight = user_json['weight']
      user.goals = user_json['goals']
      system('clear')
      puts "Welcome back #{user.name.capitalize}!!!"
      Menus.main_menu(user)
    else
      system('clear')
      puts "No user matching that name found! Let's get you started then!".colorize(:light_blue)
      user = User.new_user_input
      Menus.main_menu(user)
    end
  end

  # allows user to create a new user, name must also contain something
  def new_user_input
    user = UserData.new
    puts 'Please enter your name'
    print '> '
    name = gets.chomp.downcase
    user.name = name
    if name.empty?
      system('clear')
      puts "Can't have an empty user name".colorize(:red)
      Menus.op_menu
    else
      user.gender = Prompts.gender_selection
    end
    user.age = Errors.ask('Please enter your age')
    user.height = Errors.ask('Please enter your height in cms')
    user.weight = Errors.ask('Please enter your weight in kgs')
    user.goals = Prompts.goals_selection
    system('clear')
    save_user(user)
    user
  end
end
