class Series
  def initialize(input)
    @series = input
  end

  def slices(len)
    raise ArgumentError if @series.empty? || !len.between?(1, @series.length)

    (0..(@series.length - len)).to_a.map { |idx| @series[idx...(idx + len)] }
  end
end
