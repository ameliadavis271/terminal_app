module Details
  module_function

  def update_weight(user)
    weight = user.weight
    user.weight = Errors.ask('Please enter your new weight in kgs')
    system('clear')
    if weight.to_i > user.weight.to_i
      Quotes.inspirational
      puts 'CONGRATULATIONS ON YOUR WEIGHT LOSS!!!'.colorize(:green)
      puts "You've lost #{weight.to_i - user.weight.to_i} kgs!".colorize(:green)
    elsif weight.to_i == user.weight.to_i
      puts 'No changes to your weight at this time'.colorize(:yellow)
    else
      Quotes.motivational
      puts "Looks like you've put on #{user.weight.to_i - weight.to_i} kgs".colorize(:red)
    end
    User.save_user(user)
  end
end
