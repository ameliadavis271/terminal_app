require 'tty-prompt'
require 'colorize'
require 'json'

class UserData
  attr_accessor :name, :gender, :age, :height, :weight, :goals

  def to_json(_options)
    { name: name, gender: gender, age: age, height: height, weight: weight, goals: goals}.to_json
  end
end

module User
  module_function

  def gender_selection
    prompt = TTY::Prompt.new
    prompt.select('What is your gender?') do |menu|
      menu.choice({ name: 'Male', value: 'Male' })
      menu.choice({ name: 'Female', value: 'Female' })
    end
  end

  def goals_selection
    prompt = TTY::Prompt.new
    prompt.select('What is your goal?') do |menu|
      menu.choice({ name: 'Weight Loss', value: 'Weight Loss' })
      menu.choice({ name: 'Muscle Gain', value: 'Muscle Gain' })
    end
  end

  def save_user(user)
    File.write("data/#{user.name}.json", JSON.pretty_generate(user))
  end

  def user_login
    user = gets.chomp
    if File.exist?("data/#{user}.json")
      user_json = JSON.parse(File.read("data/#{user}.json"))
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

  def new_user_input
    user = UserData.new
    puts 'Please enter your name'
    print '> '
    name = gets.chomp.downcase
    raise ArgumentError, "Name must not be empty" if name.empty?
    user.name = name
    user.gender = gender_selection
    puts 'Please enter your age'
    print '> '
    age = gets.chomp.to_i
    user.age = age
    puts 'Please enter your height in cms'
    print '> '
    height = gets.chomp.to_i
    user.height = height
    puts 'Please enter your weight in kgs'
    print '> '
    weight = gets.chomp.to_i
    user.weight = weight
    user.goals = goals_selection
    system('clear')
    save_user(user)
    user
  end
end
