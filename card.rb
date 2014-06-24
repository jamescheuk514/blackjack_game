def initialize_card_deck
  $cards_deck = []
  until $number_of_deck > 0
    say "Please give a positive number"
    $number_of_deck = gets.to_i
  end
  $number_of_deck.times do
    arr = ["Clubs", "Diamonds", "Hearts", "Spades"]

    arr.each do |x|
      1.upto(13) do |i|
        if i == 1
          $cards_deck << "#{x} Ace"

        elsif i == 11
          $cards_deck << "#{x} Jack"
        elsif i == 12
          $cards_deck << "#{x} Queen"
        elsif i == 13
          $cards_deck << "#{x} King"
        else
          $cards_deck << "#{x} #{i}"
        end
      end
    end

  end

  $cards_deck.shuffle!

end

#assign_card_to human_player or dealer
def assign_card_to(player, amount)
  amount.times do
    player.cards << $cards_deck.pop
  end
  player.update
end


def ask_hit_or_stay
  #if player = human_player
    say 'hit or stay?'
    input = gets.chomp
    return input
  #end
end

def hit_or_stay(player1, player2)

  if player1.name != "Dealer"
    while ask_hit_or_stay.downcase == 'hit'
      assign_card_to(player1, 1)
      display_cards(player1)
      winner = check_winner(player1, player2)
      return winner if winner

    end
  else
    until player1.total_value >= 17 && player1.think == 'stay'
      say "Dealer chose to hit"
      assign_card_to(player1, 1)
      winner = check_winner(player1, player2)
      return winner if winner
    end
    say 'Dealer chose to stay'
  end
end



def check_winner(player1, player2)
  if player1.total_value == 11 && player1.include_ace
    return player1
  elsif player1.total_value == 21
    return player1
  elsif player1.total_value > 21
    return player2
  else
    return nil
  end
end

def winner?(player)
  winner == player
end

def compare_two(player1, player2)
  if  player1.value_for_compare > player2.value_for_compare
    return player1
  else
    return player2
  end
end

def say(msg)
  puts "=> #{msg}"
end

def display_cards(player)
  say "Your cards: #{player.cards}"
end

def announce(winner)
  say "The winner is #{winner.name}"
end
