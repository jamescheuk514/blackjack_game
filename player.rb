class Player
  attr_accessor :name, :cards
  attr_reader :total_value, :include_ace

  def initialize(name)
    @name = name
    @cards = []
    @total_value = 0
    @include_ace = false
  end

  def check_if_include_ace
    @include_ace = true if cards.include?(1)
  end

  def cal_total_value
    @total_value = cards.inject(0) do |sum,  n|
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

  def think
    update
    diff = 21 - @total_value
    if diff == 4 && Random.new.rand(diff) >= 3
      'hit'
    else
      'stay'
    end
  end

  def value_for_compare
    if (@total_value+10) < 21 && @include_ace
      @total_value+10
    else
      @total_value
    end
  end
end
