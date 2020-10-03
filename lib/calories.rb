require 'tty-prompt'
require 'colorize'

class Calories
  # various instance variables used to pull values from calculations to another
  def initialize
    @intake = []
    @breakfast = nil
    @lunch = nil
    @dinner = nil
    @snacks = nil
    @breakfast_intake = 0
    @lunch_intake = 0
    @dinner_intake = 0
    @snacks_intake = 0
    @total_intake = 0
  end

  # displays output of inputted meals and their calories, will appear empty if nothing logged
  def terminal_table
    rows = []
    table = Terminal::Table.new title: 'Daily Calorie Intake', headings: ['Meal', 'What you ate', 'Calories'], rows: rows, style: { width: 80 }
    table << ['Breakfast', @breakfast, @breakfast_intake]
    table << ['Lunch', @lunch, @lunch_intake]
    table << ['Dinner', @dinner, @dinner_intake]
    table << ['Snacks', @snacks, @snacks_intake]
    table << :separator
    table << ['Total Intake', '', @total_intake]
    puts table
  end

  # calculations to determine a user's daily calorie intake
  def calorie_intake(user)
    case user.gender
    when 'Male'
      male_bmr = (10 * user.weight.to_i) + (6.25 * user.height.to_i) - (5 * user.age.to_i) + 5
      puts "Your daily calorie intake is #{male_bmr} calories".colorize(:blue)
      @intake = male_bmr
    when 'Female'
      female_bmr = (10 * user.weight.to_i) + (6.25 * user.height.to_i) - (5 * user.age.to_i) - 161
      puts "Your daily calorie intake is #{female_bmr} calories".colorize(:blue)
      @intake = female_bmr
    end
  end

  # inputting daily meals
  def log_daily_meals
    system('clear')
    puts 'What did you have for breakfast?'
    print '> '
    @breakfast = gets.chomp
    @breakfast_intake = Errors.ask('How many calories were in your breakfast?')
    puts 'What did you have for lunch?'
    print '> '
    @lunch = gets.chomp
    @lunch_intake = Errors.ask('How many calories were in your lunch?')
    puts 'What did you have for dinner?'
    print '> '
    @dinner = gets.chomp
    @dinner_intake = Errors.ask('How many calories were in your dinner?')
    puts 'What did you have for snacks?'
    print '> '
    @snacks = gets.chomp
    @snacks_intake = Errors.ask('How many calories were in your snacks?')
    system('clear')
  end

  # calculations to determine the difference between logged intake against recommended calorie intake
  # also gives various outputs based on the difference
  def log_daily_intake
    system('clear')
    @total_intake = @breakfast_intake.to_i + @lunch_intake.to_i + @dinner_intake.to_i + @snacks_intake.to_i
    if @total_intake >= (@intake + 1000)
      system('clear')
      puts "You went over your intake by #{@total_intake - @intake} calories".colorize(:red)
      puts 'Might wanna ease up on the KFC!'.colorize(:red)
    elsif @total_intake >= @intake
      system('clear')
      Quotes.motivational
      puts "You went over your intake by #{@total_intake - @intake} calories".colorize(:yellow)
    elsif @total_intake < @intake && @total_intake > (@intake - 500)
      system('clear')
      Quotes.inspirational
      puts "You were at a deficit of #{@intake - @total_intake} calories".colorize(:green)
    elsif @total_intake < (@intake - 500) && @total_intake > 0
      system('clear')
      puts "You were at a deficit of #{@intake - @total_intake} calories".colorize(:red)
      puts "Starving yourself doesn't help. Try remain at a 500 deficit max!".colorize(:red)
    end
    terminal_table
  end
end
