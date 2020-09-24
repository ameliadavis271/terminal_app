require 'tty-prompt'
require 'colorize'


def generate_daily_intake(user_input)
  if user_input[:gender] == "male"
    male_bmr = (10 * user_input[:weight]) + (6.25 * user_input[:height]) - (5 * user_input[:age]) + 5
    puts "Your daily calorie intake is #{male_bmr} calories"
  elsif user_input[:gender] == "female" 
    female_bmr = (10 * user_input[:weight]) + (6.25 * user_input[:height]) - (5 * user_input[:age]) - 161
    puts "Your daily calorie intake is #{female_bmr} calories"
  end
end
