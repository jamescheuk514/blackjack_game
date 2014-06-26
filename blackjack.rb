class Blackjack

  include Sayable
  include DisplayCards
  include BlackjackRule
  include GameCondition

  attr_accessor :deck, :player, :dealer

  def initialize(name, num)
    @deck = Deck.new(num)
    @player = Player.new(name)
    @dealer = Dealer.new("Dealer")
  end


  def run
    2.times do
      deal_card player
      deal_card dealer
    end
    turn player
    unless end?
      turn dealer
    end
    unless get_winner
      resolve_tie(player, dealer)
    end
    announce(get_winner)
  end


  def deal_card(gameplayer)
    tmp = deck.deal
    gameplayer.cards << tmp
  end

  def turn(gameplayer)
    say "Now is #{gameplayer.name}'s turn"
    display_cards(player.cards)
    winner?(gameplayer)
    while hit_or_stay_decision(gameplayer) && !end?
      say "#{gameplayer.name} chose hit"
      deal_card gameplayer
      display_cards(gameplayer.cards)
      winner?(gameplayer)
      break if end?
    end
  end

  def hit_or_stay_decision(gameplayer)
    case gameplayer.make_decision
    when "hit"
      true
    when "stay"
      false
    else
      hit_or_stay_decision(gameplayer)
    end
  end

  def announce(winner)
    unless winner == nil
      say "The winner is #{winner.name}."
    else
      say "There is no winner."
    end
  end
end
