require 'spec_helper'

describe Die do
  it 'can optionally set sides in initializer' do
    die = Die.new [1, 2, 3]
    die.sides.should eq [1, 2, 3]
  end

  it 'converts sides set in initializer' do
    die = Die.new 1..20
    die.sides.should eq (1..20).to_a
  end

  describe '#sides' do
    it 'converts from Range' do
      die = Die.new
      die.sides = 1..20
      die.sides.should eq (1..20).to_a
    end

    it 'converts from Fixnum' do
      die = Die.new
      die.sides = 20
      die.sides.should eq (1..20).to_a
    end

    it 'converts using to_a' do
      obj = Object.new
      obj.should receive(:to_a) { (1..20).to_a }

      die = Die.new
      die.sides = obj
      die.sides.should eq (1..20).to_a
    end

    it 'raises error for unconvertible object' do
      obj = Object.new
      die = Die.new
      lambda { die.sides = obj }.should raise_error TypeError
    end

    it 'sets sides' do
      die = Die.new
      die.sides = (1..20).to_a
      die.sides.should eq (1..20).to_a
    end

    it 'defaults to six sides' do
      die = Die.new
      die.sides.should eq (1..6).to_a
    end
  end

  describe '#roll' do
    it 'returns value between 1 and 6' do
      die = Die.new
      10.times do
        (1..6).should include die.roll
      end
    end

    it 'returns random value' do
      die = Die.new
      results = []
      10.times do
        results << die.roll
      end
      results.uniq.count.should be > 1
    end
  end
end
