class Card
  attr_reader :suit, :face, :value

  def initialize(s, f, v)
    @suit = s
    @face = f
    @value = v
  end

  def to_s
    "#{suit} #{face}"
  end
end


class Deck

  attr_accessor :cards
  attr_reader :num

  def initialize(num)
    @cards = []
    arr = ["Clubs", "Diamonds", "Hearts", "Spades"]

    arr.each do |suit|
      1.upto(13) do |value|
        case value
        when 1
          @cards << Card.new(suit, "Ace", value)
        when 11
          @cards << Card.new(suit, "Jack", value)
        when 12
          @cards << Card.new(suit, "Queen", value)
        when 13
          @cards << Card.new(suit, "King", value)
        else
          @cards << Card.new(suit, value.to_s, value)
        end
      end
    end
    @cards = @cards * num
    shuffle_deck!
  end

  def shuffle_deck!
    cards.shuffle!
  end

  def deal
    cards.pop
  end
end
