module Prompts
  module_function

  def gender_selection
    prompt = TTY::Prompt.new
    prompt.select('What is your gender?') do |menu|
      menu.choice({ name: 'Male', value: 'Male' })
      menu.choice({ name: 'Female', value: 'Female' })
    end
  end

  def goals_selection
    prompt = TTY::Prompt.new
    prompt.select('What is your goal?') do |menu|
      menu.choice({ name: 'Weight Loss', value: 'Weight Loss' })
      menu.choice({ name: 'Muscle Gain', value: 'Muscle Gain' })
    end
  end

  def op_selection
    prompt = TTY::Prompt.new
    prompt.select('Welcome! Please select an option') do |menu|
      menu.choice({ name: 'Create New User', value: '1' })
      menu.choice({ name: 'Login', value: '2' })
      menu.choice({ name: 'Exit', value: '3' })
    end
  end

  def main_selection
    prompt = TTY::Prompt.new
    prompt.select('What would you like to do?') do |menu|
      menu.choice({ name: 'Log Daily Meals', value: '1' })
      menu.choice({ name: 'Display Daily Intake', value: '2' })
      menu.choice({ name: 'Update Current Weight', value: '3' })
      menu.choice({ name: 'Needing Inspiration?', value: '4' })
      menu.choice({ name: 'Exit', value: '5' })
    end
  end

end
