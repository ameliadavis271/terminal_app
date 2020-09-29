module Details
  module_function

  def update_weight(user)
    puts 'Please enter your new weight in kgs'
    print '> '
    weight = gets.chomp.to_i
    system('clear')
    if weight < user.weight
      puts 'CONGRATULATIONS ON YOUR WEIGHT LOSS!!!'.colorize(:green)
      puts "You've lost #{user.weight - weight} kgs!".colorize(:green)
    elsif weight == user.weight
      puts 'No changes to your weight at this time'.colorize(:yellow)
    else
      puts "Looks like you've put on #{weight - user.weight} kgs".colorize(:red)
    end
    user.weight = weight
    User.save_user(user)
  end
end
