require 'tty-prompt'
require 'colorize'

module Menus
  def self.op_selection
    prompt = TTY::Prompt.new
    prompt.select('Welcome! Please select an option') do |menu|
      menu.choice({ name: 'Create New User', value: '1' })
      menu.choice({ name: 'Login', value: '2' })
      menu.choice({ name: 'Exit', value: '3' })
    end
  end

  def self.main_selection
    prompt = TTY::Prompt.new
    prompt.select('What would you like to do?') do |menu|
      menu.choice({ name: 'Log Daily Calories', value: '1' })
      menu.choice({ name: 'Update Weight', value: '2' })
      menu.choice({ name: 'Needing Inspiration?', value: '3' })
      menu.choice({ name: 'Exit', value: '4' })
    end
  end

  def self.quit
    system('clear')
    exit
  end

  def self.op_menu
    loop do
      case op_selection
      when '1'
        user = User.new_user_input
        main_menu(user)
      when '2'
        User.user_login
      when '3'
        quit
      end
    end
  end

  def self.main_menu(user)
    calories = Calories.new
    loop do
      calories.calorie_intake(user)
      case main_selection
      when '1'
        calories.log_daily_intake
      when '2'
        calories.update_weight(user)
      when '3'
        quotes
      when '4'
        quit
      end
    end
  end
end
