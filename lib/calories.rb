require 'tty-prompt'
require 'colorize'

class Calories
  def initialize
    @intake = []
  end

  def calorie_intake(user)
    case user[:gender]
    when 'Male'
      male_bmr = (10 * user[:weight]) + (6.25 * user[:height]) - (5 * user[:age]) + 5
      puts "Your daily calorie intake is #{male_bmr} calories".colorize(:blue)
      @intake << male_bmr
    when 'Female'
      female_bmr = (10 * user[:weight]) + (6.25 * user[:height]) - (5 * user[:age]) - 161
      puts "Your daily calorie intake is #{female_bmr} calories".colorize(:blue)
      @intake << female_bmr
    end
  end

  def log_daily_intake
    puts "Please enter how many calories you've had today"
    print '> '
    logged_intake = gets.chomp.to_i
    if logged_intake >= (@intake[0] + 1000)
      system('clear')
      puts 'Might wanna ease up on the KFC!'.colorize(:red)
    elsif logged_intake >= @intake[0]
      system('clear')
      puts "You went over your intake by #{logged_intake - @intake[0]} calories".colorize(:yellow)
    elsif logged_intake < @intake[0] && logged_intake > (@intake[0] - 500)
      system('clear')
      puts "You were at a deficit of #{@intake[0] - logged_intake} calories".colorize(:green)
    elsif logged_intake < (@intake[0] - 500)
      system('clear')
      puts 'Starving yourself is actually not ideal for weight loss!'.colorize(:red)
    end
  end
end
