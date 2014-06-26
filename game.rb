require "./helper.rb"
require "./card.rb"
require "./player.rb"
require "./blackjack.rb"

require "pry"


class Game

  include Sayable

  attr_reader :player_name

  def initialize
    welcome
    @player_name = ask_name
    blackjack = Blackjack.new(@player_name, ask_deck)
    blackjack.run
  end

  def welcome
    say "Welcome to Blackjack ----command line version."
    end

  def ask_name
    say "What is your name?"
    gets.chomp
  end
  def ask_deck
    say "Hi #{player_name}. How many deck you need for the game?"
    num = gets.to_i
    until num > 0
      say "Please give a positive number"
      num = gets.to_i
    end
    num
  end

end

game = Game.new
#
#   say "Do you want to play again?(y/n)"
#   ans = gets.chomp
#   if ans == 'n'
#     continue = false
#   end
#
# say "**Bye"
