require 'tty-prompt'
require 'colorize'
require 'terminal-table'

require_relative 'details'
require_relative 'user'
require_relative 'errors'
require_relative 'prompts'
require_relative 'menu'
require_relative 'calories'
require_relative 'quotes'

def help
  system('clear')
  puts '---------------------HELP---------------------'
  puts '-i        Will display an inspirational quote'
  puts '-m        Will display a motivational quote'
  puts 'user id   Will auto login as user        '
  puts '----------------------------------------------'
end

if ARGV[0]
  case ARGV[0]
  when '-m'
    Quotes.motivational
    exit
  when '-i'
    Quotes.inspirational
    exit
  when '-h', '--help'
    help
    exit
  end
end

system('clear')
Menus.op_menu
