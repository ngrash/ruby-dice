require 'spec_helper'

describe DiceSet do
  it 'sets dices' do
    dices = [Dice.new, Dice.new, Dice.new]
    set = DiceSet.new(dices)
    set.dices.should be dices
  end
  
  it 'can roll' do
    dices = DiceSet.new([Dice.new, Dice.new, Dice.new])
    result = dices.roll
    result.count.should be 3
  end
end