class SumOfMultiples
  def initialize(*args)
    @items = args
  end

  def to(level)
    @items.map { |n| (n == 0) ? 0 : (n...level).step(n).to_a }.flatten.uniq.sum
  end
end
