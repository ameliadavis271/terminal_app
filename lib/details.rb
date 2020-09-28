module Details
  module_function

  def update_weight(user)
    puts 'Please enter your new weight in kgs'
    print '> '
    weight = gets.chomp.to_i
    system('clear')
    if weight < user.weight
      puts "CONGRATULATIONS ON YOUR WEIGHT LOSS!!!".colorize(:green)
      puts "You've lost #{user.weight - weight} kgs!".colorize(:green)
    else 
      puts "Looks like you've put on #{weight - user.weight} kgs".colorize(:yellow)
      puts "Try to exercise more regularly and maintain a healthy diet!".colorize(:green)
    end
    user.weight = weight
    User.save_user(user)
  end

  def update_height(user)
    puts 'Please enter your new height in kgs'
    print '> '
    height = gets.chomp.to_i
    system('clear')
    user.height = height
    User.save_user(user)
  end

  def update_age(user)
    puts 'Please enter your new height in kgs'
    print '> '
    height = gets.chomp.to_i
    system('clear')
    user.age = age
    User.save_user(user)
  end
end
