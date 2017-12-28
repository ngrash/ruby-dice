require 'forwardable'

class DieSet
  attr_reader :dice

  include Enumerable
  extend Forwardable

  def_delegators :@dice, :each, :[]

  def initialize(dice)
    @dice = dice
  end

  def roll
    @dice.collect do |die|
      die.roll
    end
  end
end
