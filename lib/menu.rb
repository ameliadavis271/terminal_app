require 'tty-prompt'
require 'colorize'
require 'terminal-table'

module Menus
  module_function

  def op_selection
    prompt = TTY::Prompt.new
    prompt.select('Welcome! Please select an option') do |menu|
      menu.choice({ name: 'Create New User', value: '1' })
      menu.choice({ name: 'Login', value: '2' })
      menu.choice({ name: 'Exit', value: '3' })
    end
  end

  def main_selection
    prompt = TTY::Prompt.new
    prompt.select('What would you like to do?') do |menu|
      menu.choice({ name: 'Log Daily Meals', value: '1' })
      menu.choice({ name: 'Display Daily Intake', value: '2' })
      menu.choice({ name: 'Update Current Weight', value: '3' })
      menu.choice({ name: 'Needing Inspiration?', value: '4' })
      menu.choice({ name: 'Exit', value: '5' })
    end
  end

  def quit
    system('clear')
    exit
  end

  def op_menu
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

  def main_menu(user)
    calories = Calories.new
    loop do
      calories.calorie_intake(user)
      case main_selection
      when '1'
        calories.log_daily_meals
      when '2'
        calories.log_daily_intake
      when '3'
        Details.update_weight(user)
      when '4'
        Quotes.inspirational
      when '5'
        quit
      end
    end
  end
end
