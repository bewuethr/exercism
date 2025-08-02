class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    valid? && @sides.uniq.size == 1
  end

  def isosceles?
    valid? && @sides.uniq.size <= 2
  end

  def scalene?
    valid? && @sides.uniq.size == 3
  end

  private def valid?
    @sides.none?(&:zero?) && @sides.each_with_index.all? do |s, idx|
      @sides[...idx].concat(@sides[idx + 1...]).sum >= s
    end
  end
end
