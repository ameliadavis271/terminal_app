require 'tty-prompt'
require 'colorize'

def quotes
  motivation = [
    "It does not matter how slow you go, as long as you don't stop!",
    "Don't let a stumble in the road be the end of your journey!",
    "Don't dig your grave with your own knife and fork!",
    'When you eat crap. You feel crap!',
    'KEEP GOING!',
    'Take it one day at a time!',
    'When you feel like quitting, remember why you started!',
    'Fall seven times, stand up eight!',
    'Every step is progress, no matter how small!',
    "A year from now you'll wish you started today!",
    "There's no such thing as failure. Either you win, or you learn!",
    "You'll never win, if you never begin!",
    'You are your own limit!',
    'If you know you can do better, then do better!',
    'It is never too late!'
  ]
  system('clear')
  puts motivation.sample.colorize(:light_blue)
end
