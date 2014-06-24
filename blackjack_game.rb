require './card.rb'
require "./player.rb"

require "pry"





say "What is your name?"
$human_player = Player.new(gets.chomp)
$dealer = Player.new("Dealer")

say "Hi #{$human_player.name}. How many deck you need for the game?"
$number_of_deck = gets.to_i
initialize_card_deck

assign_card_to($human_player, 2)
display_cards($human_player)
assign_card_to($dealer, 2)

$winner = check_winner($human_player)


hit_or_stay($human_player)

if $winner.nil? || $winner != $dealer
  say "This is dealer's turn"
  hit_or_stay($dealer)
end

if $winner.nil?
  $winner = compare_two($human_player, $dealer)
end

announce_winner
