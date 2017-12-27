class Fixnum
  def dice(sides=nil)
    DieSet.new(self.times.collect { Die.new(sides) })
  end
end
