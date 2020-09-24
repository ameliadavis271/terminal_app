require 'tty-prompt'
require 'colorize'



def generate_daily_calories(gender)
  if gender == "male"
    male_bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5
  elsif gender == "female" 
    female_bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161
  end
end