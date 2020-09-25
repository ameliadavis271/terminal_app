require 'tty-prompt'
require 'colorize'
require 'json'

module User
  def self.gender_selection
    prompt = TTY::Prompt.new
    prompt.select('What is your gender?') do |menu|
      menu.choice({ name: 'Male', value: 'Male' })
      menu.choice({ name: 'Female', value: 'Female' })
    end
  end

  def create_user
    user = User.new_user_input
    users.JSON << User.new(users.JSON.length + 1)
  end

  def self.new_user_input
    user = {}
    puts 'Please enter your name'
    print '> '
    name = gets.chomp
    user[:name] = name
    user[:gender] = gender_selection
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
    system('clear')
    File.write('users.JSON', JSON.pretty_generate([user]))
    user
  end
end
