class Fixnum
  def dices(sides=nil)  
    DiceSet.new(self.times.collect { Dice.new(sides) })
  end
end