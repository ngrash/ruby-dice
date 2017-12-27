require 'spec_helper'

describe DieSet do
  it 'sets dice' do
    dice = [Die.new, Die.new, Die.new]
    set = DieSet.new(dice)
    set.dice.should be dice
  end

  it 'can roll' do
    set = DieSet.new([Die.new, Die.new, Die.new])
    result = set.roll
    result.count.should be 3
  end
end
