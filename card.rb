def initialize_card_deck
  $card_deck = []
  until $number_of_deck > 0
    say "Please give a positive number"
    $number_of_deck = gets.to_i
  end
  $number_of_deck.times do
    4.times do
      1.upto(13) do |i|
        $card_deck << i
      end
    end
  end

  $card_deck.shuffle!

end

#assign_card_to human_player or dealer
def assign_card_to(player, amount)
  amount.times do
    player.cards << $card_deck.pop
    player.update
  end
end


def ask_hit_or_stay
  #if player = human_player
    say 'hit or stay?'
    input = gets.chomp
    return input
  #end
end

def hit_or_stay(player)

  if player == $human_player
    while ask_hit_or_stay.downcase == 'hit'

      assign_card_to(player, 1)
      player.update
      display_cards(player)
      $winner = check_winner(player)
      break if $winner
    end
  else
    until player.total_value >= 17 && player.think == 'stay'
      say "Dealer chose to hit"
      assign_card_to(player, 1)
      player.update
      $winner = check_winner(player)
      break if $winner
    end
    say 'Dealer chose to stay'
  end
end



def check_winner(player)
  if player.total_value == 11 && player.include_ace
    player
  elsif player.total_value == 21
    player
  elsif player.total_value > 21
    $human_player if player == $dealer
    $dealer if player == $human_player
  else
    nil
  end
end


def compare_two(player1, player2)
  if  player1.value_for_compare > player2.value_for_compare
    return player1
  else
    return player2
  end
  binding.pry
end

def say(msg)
  puts "=> #{msg}"
end

def display_cards(player)
  say "Your cards: #{player.cards}"
end

def announce_winner
  unless $winner.nil?
    say "The winner is #{$winner.name}"
  end
end
