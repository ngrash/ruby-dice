require 'spec_helper'

describe 'Fixnum extensions' do
  it 'can create n die' do
    dice = 3.dice
    dice.count.should be 3
  end

  it 'can set sides' do
    dice = 3.dice 1..20
    dice.count.should be 3
    (0...2).each do |die|
      dice[die].sides.should eq (1..20).to_a
    end
  end
end
