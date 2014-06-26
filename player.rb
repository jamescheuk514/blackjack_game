class GamePlayer
  include Sayable
  include CheckCards

  attr_accessor :name, :cards, :cards_value, :win, :lose
  def initialize(name)
    @name = name
    @cards = []
    @win = nil
  end

end


class Player < GamePlayer

  def make_decision
    say "hit or stay"
    input = gets.chomp
    #should add some regex
    input.downcase
  end
end


class Dealer < GamePlayer
  def make_decision
    if total_value < 17
      'hit'
    else
      diff = 21 - total_value
      tmp = Random.rand(0.0..diff)
      if tmp > 3.5
        'hitc'
      else
        'stay'
      end
    end
  end
end
