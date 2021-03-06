require 'tty-prompt'
require 'colorize'
require 'terminal-table'

module Menus
  module_function

  # small method to close app and clear terminal to a reset state
  def quit
    system('clear')
    exit
  end

  # opening menu to create a new user or login as one
  def op_menu
    loop do
      case Prompts.op_selection
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

  # main menu for a user to do various actions
  def main_menu(user)
    calories = Calories.new
    loop do
      calories.calorie_intake(user)
      case Prompts.main_selection
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
