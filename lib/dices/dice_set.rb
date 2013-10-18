class DiceSet
  attr_reader :dices

  include Enumerable
  
  def initialize(dices)
    @dices = dices
  end
  
  def roll
    @dices.collect do |dice|
      dice.roll
    end
  end
  
  def each(&block)
	@dices.each(&block)
  end
  
  def [](index)
    @dices[index]
  end
end