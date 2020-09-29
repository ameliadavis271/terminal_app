require 'tty-prompt'
require 'colorize'
require 'terminal-table'

require_relative 'details'
require_relative 'user'
require_relative 'errors'
require_relative 'menu'
require_relative 'calories'
require_relative 'motivation'

def help
  system('clear')
  puts '-------------------HELP-------------------'
  puts '-m        Will display a motivation quote'
  puts 'user id   Will auto login as user        '
  puts '------------------------------------------'
end

if ARGV[0]
  case ARGV[0]
  when '-m'
    quotes
    exit
  when '-h', '--help'
    help
    exit
  end
end

system('clear')
Menus.op_menu
