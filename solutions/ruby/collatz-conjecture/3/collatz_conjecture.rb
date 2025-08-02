module CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n > 0

    Enumerator.produce(n) { |num| num.odd? ? 3 * num + 1 : num / 2 }.find_index(1)
  end
end
