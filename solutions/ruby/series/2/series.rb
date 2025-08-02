class Series
  def initialize(input)
    @series = input
  end

  def slices(len)
    raise ArgumentError if len > @series.length

    @series.chars.each_cons(len).map(&:join)
  end
end
