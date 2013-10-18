require 'spec_helper'

describe Dice do 
  it 'can optionally set sides in initializer' do
    dice = Dice.new [1, 2, 3]
    dice.sides.should eq [1, 2, 3]
  end
  
  it 'converts sides set in initializer' do
    dice = Dice.new 1..20
    dice.sides.should eq (1..20).to_a
  end

  describe '#sides' do
    it 'converts from Range' do
      dice = Dice.new
      dice.sides = 1..20
      dice.sides.should eq (1..20).to_a
    end
    
    it 'converts from Fixnum' do
      dice = Dice.new
      dice.sides = 20
      dice.sides.should eq (1..20).to_a
    end
    
    it 'converts using to_a' do
      obj = Object.new
      expect(obj).to receive(:to_a) { (1..20).to_a }
      
      dice = Dice.new
      dice.sides = obj
      dice.sides.should eq (1..20).to_a
    end
    
    it 'raises error for unconvertible object' do
      obj = Object.new
      dice = Dice.new
      expect { dice.sides = obj }.to raise_error TypeError
    end
  
    it 'sets sides' do
      dice = Dice.new
      dice.sides = (1..20).to_a
      dice.sides.should eq (1..20).to_a 
    end
  
    it 'defaults to six sides' do
      dice = Dice.new
      dice.sides.should eq (1..6).to_a
    end
  end

  describe '#roll' do
    it 'returns value between 1 and 6' do
      dice = Dice.new
      10.times do
        (1..6).should include dice.roll
      end
    end
    
    it 'returns random value' do
      dice = Dice.new
      results = []
      10.times do
        results << dice.roll
      end
      results.uniq.count.should be > 1
    end
  end
end