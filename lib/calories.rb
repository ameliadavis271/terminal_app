require 'tty-prompt'
require 'colorize'

class Calories

@intake = []

def self.calorie_intake(user_input)
  if user_input[:gender] == "male"
    male_bmr = (10 * user_input[:weight]) + (6.25 * user_input[:height]) - (5 * user_input[:age]) + 5
    puts "Your daily calorie intake is #{male_bmr} calories"
    @intake << male_bmr
  elsif user_input[:gender] == "female" 
    female_bmr = (10 * user_input[:weight]) + (6.25 * user_input[:height]) - (5 * user_input[:age]) - 161
    puts "Your daily calorie intake is #{female_bmr} calories"
    @intake << female_bmr
  end

end

def self.log_daily_intake
  puts "Please enter how many calories you've had today"
  print "> "
  logged_intake = gets.chomp.to_i
  if logged_intake >= @intake[0]
    system("clear")
    puts "You went over your intake by #{logged_intake - @intake[0]} calories"
  elsif logged_intake < @intake[0]
    system("clear")
    puts "You were at a deficit of #{logged_intake - @intake[0]} calories"
  end
end

# def self.daily_difference(calorie_intake, logged_intake)
#   if log_daily_intake >= calorie_intake
#     puts "High"
#   elsif log_daily_intake < calorie_intake
#     puts "Low"
#   end
# end

end