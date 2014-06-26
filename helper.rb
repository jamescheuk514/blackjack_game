module Sayable
  def say(msg)
    puts "===> #{msg}"
  end
end


module DisplayCards
  def display_cards(cards)
    say "Cards: "
    cards.each { |card| say card.to_s }
  end
end

#respond to cards

module CheckCards

  def include_ace?
    if cards.any? { |card| card.face == "Ace" }
      true
    else
      false
    end
  end

  def total_value
    tmp = cards.inject(0) do |sum,  card|
      if card.value > 10
        sum += 10
      else
        sum += card.value
      end
    end
    tmp
  end
end

module BlackjackRule

  def winner?(gameplayer)
    value = gameplayer.total_value
    if value == 11 && gameplayer.include_ace?
      gameplayer.win = true
      true
    elsif value == 21
      gameplayer.win = true
      true
    elsif value > 21
      gameplayer.lose = true
      false
    else
      false
    end
  end

  def resolve_tie(player1, player2)
    value1 = player1.total_value
    value2 = player2.total_value
    if value1 > value2
      player1.win = true
    elsif value2 > value1
      player2.win = true
    else
      false
    end
  end
end

module GameCondition

  def any_win?
    player.win || dealer.win
  end
  def end?
    any_win?
  end

  def get_winner
    if player.win
      player
    elsif dealer.win
      dealer
    else
      nil
    end
  end
end
