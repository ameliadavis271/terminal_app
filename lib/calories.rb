require 'tty-prompt'
require 'colorize'

module Calories

  include ::Menu

  def generate_daily_calories
    if gender == "male"
      male_bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5
      puts male_bmr
    elsif gender == "female" 
      female_bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161
      puts female_bmr
    end
  end
end
