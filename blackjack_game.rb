require './card.rb'
require "./player.rb"

require "pry"



continue = true

say "Welcome to Blackjack ----command line version."
say "What is your name?"
human_player = Player.new(gets.chomp)
dealer = Player.new("Dealer")

say "Hi #{human_player.name}. How many deck you need for the game?"
num = gets.to_i
until num > 0
  say "Please give a positive number"
  num = gets.to_i
end

while continue
  human_player.reset
  dealer.reset

  winner = nil


  initialize_card_deck(num)
  
  assign_card_to(human_player, 2)
  display_cards(human_player)
  assign_card_to(dealer, 2)

  winner = check_winner(human_player, dealer)
  winner = hit_or_stay(human_player, dealer)

  if winner.nil?
    say "This is dealer's turn"
    winner = hit_or_stay(dealer, human_player)
  end

  if winner.nil?
    winner = compare_two(human_player, dealer)
  end

  announce winner
  display_cards(human_player)
  display_cards(dealer)

  say "Do you want to play again?(y/n)"
  ans = gets.chomp
  if ans == 'n'
    continue = false
  end
end

say "**Bye"
