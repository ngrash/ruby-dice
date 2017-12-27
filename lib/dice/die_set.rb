class DieSet
  attr_reader :dice

  include Enumerable

  def initialize(dice)
    @dice = dice
  end

  def roll
    @dice.collect do |die|
      die.roll
    end
  end

  def each(&block)
    @dice.each(&block)
  end

  def [](index)
    @dice[index]
  end
end
