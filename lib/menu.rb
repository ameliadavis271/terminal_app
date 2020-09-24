require "tty-prompt"
require "colorize"


prompt = TTY::Prompt.new

def selection
  prompt = TTY::Prompt.new
  prompt.select('What would you like to do?') do |menu|
    menu.choice({ name: 'Log Daily Calories', value: '1'})
    menu.choice({ name: 'Update Weight', value: '2'})
    menu.choice({ name: 'Needing Inspiration?', value: '3'})
    menu.choice({ name: 'Exit', value: '4'})
  end
end

def menu(user_input)
  loop do 
    case selection
      when '1'
        generate_daily_intake(user_input)
      when '2'
        update_credentials
      when '3'
        random_quote
      when '4'
        quit
    end
  end
end