module Details
  module_function

  def update_weight(user)
    puts 'Please enter your new weight in kgs'
    print '> '
    weight = gets.chomp.to_i
    system('clear')
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
