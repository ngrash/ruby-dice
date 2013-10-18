class Dice
  attr_reader :sides

  def initialize(sides=nil)
    self.sides = sides || (1..6).to_a
  end

  def sides=(sides)
    if sides.respond_to? :to_a
      @sides = sides.to_a
    elsif sides.is_a? Fixnum
      @sides = (1..sides).to_a
    else
      raise TypeError, "Cannot convert '#{sides.class}' to 'Array'"
    end
  end
  
  def roll
    @@random ||= Random.new    
    @sides[@@random.rand(0...sides.count)]
  end
end