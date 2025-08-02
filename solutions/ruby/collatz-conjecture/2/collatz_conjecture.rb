module CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n > 0

    Enumerator.produce(n) do |num|
      num.odd? ? 3 * num + 1 : num / 2
    end.lazy.find_index(1)
  end
end
