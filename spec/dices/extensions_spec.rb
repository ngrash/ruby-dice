require 'spec_helper'

describe 'Fixnum extensions' do
  it 'can create n dices' do
    dices = 3.dices
    dices.count.should be 3
  end
  
  it 'can set sides' do
    dices = 3.dices 1..20
    dices.count.should be 3
    (1...3).each do |dice|
      dices[dice].sides.should eq (1..20).to_a
    end
  end
end