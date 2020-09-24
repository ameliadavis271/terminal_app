require 'tty-prompt'
require 'colorize'


def calorie_intake(user_input)
  if user_input[:gender] == "male"
    male_bmr = (10 * user_input[:weight]) + (6.25 * user_input[:height]) - (5 * user_input[:age]) + 5
    puts "Your daily calorie intake is #{male_bmr} calories"
  elsif user_input[:gender] == "female" 
    female_bmr = (10 * user_input[:weight]) + (6.25 * user_input[:height]) - (5 * user_input[:age]) - 161
    puts "Your daily calorie intake is #{female_bmr} calories"
  end
end

def log_daily_intake
  puts "Please enter how many calories you've had today"
  print "> "
  logged_intake = gets.chomp.to_i
end

def daily_difference(calorie_intake, daily_intake)
  if daily_intake > calorie_intake
    puts "High"
  elsif daily_intake < calorie_intake
    puts "Low"
  end
end