require 'tty-prompt'
require 'colorize'

module Quotes
  module_function

  def inspirational
    inspiration = [
      "It does not matter how slow you go, as long as you don't stop!",
      'KEEP GOING!',
      'Every step is progress, no matter how small!',
      "There's no such thing as failure. Either you win, or you learn!",
      "It has to be hard so you'll never ever forget!",
      "Weight loss doesn't begin with a dumb bell. It starts in your head with a decision!",
      'If you have discipline, drive and determination...nothing is impossible!',
      "Continue to take care of your body and it'll take care of you!",
      'Looking after your health today gives you a better hope for tomorrow!',
      'The hard days is what makes you stronger',
      'Slow and steady wins the race!',
      'Strive for progress, not perfection!'
    ]
    system('clear')
    puts inspiration.sample.colorize(:light_blue)
  end

  def motivational
    motivation = [
      "Don't let a stumble in the road be the end of your journey!",
      'If you know you can do better, then do better!',
      'When you feel like quitting, remember why you started!',
      "You'll never win, if you never begin!",
      "A year from now you'll wish you started today!",
      'Take it one meal at a time!',
      'Fall seven times, stand up eight!',
      'It is never too late!',
      "There's no such thing as failure. Either you win, or you learn!",
      'When you eat crap. You feel crap!',
      "Don't dig your grave with your own knife and fork!",
      'You are your own limit!'
    ]
    system('clear')
    puts motivation.sample.colorize(:light_blue)
  end
end
