require 'tty-prompt'
require 'colorize'

class Calories
  def initialize
    @intake = []
    @breakfast
    @lunch
    @dinner
    @snacks
    @breakfast_intake = []
    @lunch_intake = []
    @dinner_intake = []
    @snacks_intake = []
    @total_intake = 0
  end

  def terminal_table
    rows = []
    table = Terminal::Table.new title: 'Daily Calorie Intake', headings: ['Meal', 'What you ate', 'Calories'], rows: rows, :style => {:width => 80}
    table << ['Breakfast', @breakfast, @breakfast_intake]
    table << ['Lunch', @lunch, @lunch_intake]
    table << ['Dinner', @dinner, @dinner_intake]
    table << ['Snacks', @snacks, @snacks_intake]
    table << :separator
    table << ['Total Intake', "", @total_intake]
    puts table
  end

  def calorie_intake(user)
    case user.gender
    when 'Male'
      male_bmr = (10 * user.weight) + (6.25 * user.height) - (5 * user.age) + 5
      puts "Your daily calorie intake is #{male_bmr} calories".colorize(:blue)
      @intake = male_bmr
    when 'Female'
      female_bmr = (10 * user.weight) + (6.25 * user.height) - (5 * user.age) - 161
      puts "Your daily calorie intake is #{female_bmr} calories".colorize(:blue)
      @intake = female_bmr
    end
  end

  def log_daily_meals
    system('clear')
    puts 'What did you have for breakfast?'
    print '> '
    @breakfast = gets.chomp
    puts 'How many calories was it?'
    print '> '
    @breakfast_intake = gets.chomp.to_i
    puts 'What did you have for lunch?'
    print '> '
    @lunch = gets.chomp
    puts 'How many calories was it?'
    print '> '
    @lunch_intake = gets.chomp.to_i
    puts 'What did you have for dinner?'
    print '> '
    @dinner = gets.chomp
    puts 'How many calories was it?'
    print '> '
    @dinner_intake = gets.chomp.to_i
    puts 'What did you have for snacks?'
    print '> '
    @snacks = gets.chomp
    puts 'How many calories was it?'
    print '> '
    @snacks_intake = gets.chomp.to_i
    system('clear')
  end

  def log_daily_intake
    system('clear')
    @total_intake = @breakfast_intake + @lunch_intake + @dinner_intake + @snacks_intake
    if @total_intake >= (@intake + 1000)
      system('clear')
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
      puts 'Starving yourself is actually not ideal for weight loss!'.colorize(:red)
    end
    terminal_table
  end
end
