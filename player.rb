class Player
  attr_accessor :name, :cards , :cards_value
  attr_reader :total_value, :include_ace

  def initialize(name)
    @name = name
    @cards = []
    @cards_value = []
    @total_value = 0
    @include_ace = false
  end

  def extract_cards_value
    tmp = []
    @cards.each { |x| tmp << x.split(' ') }
    tmp.flatten!
    arr = ["Clubs", "Diamonds", "Hearts", "Spades"]
    tmp.delete_if { |x| arr.include?(x) }



    @cards_value = tmp.map do |x|
      if x == "Jack" or x == "Queen" or x == "King"
        10
      elsif x == "Ace"
        1
      else
        x.to_i
      end
    end

  end

  def check_if_include_ace
    @include_ace = true if cards.include?("Ace")
  end


  def cal_total_value
    extract_cards_value
    @total_value = cards_value.inject(0) do |sum,  n|
      if n > 10
        sum += 10
      else
        sum += n
      end
    end
  end

  def update
    check_if_include_ace
    cal_total_value
  end


  def value_for_compare
    if (@total_value+10) < 21 && @include_ace
      @total_value+10
    else
      @total_value
    end
  end

  def reset
    @cards = []
    @cards_value = []
    @total_value = 0
    @include_ace = false
  end

  def think
    update
    diff = 21 - @total_value
    if diff == 4 && Random.new.rand(diff) >= 3
      'hit'
    else
      'stay'
    end
  end
end
