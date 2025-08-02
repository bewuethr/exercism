module CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n > 0

    Enumerator.produce(n) do |num|
      if num.odd?
        3 * num + 1
      else
        num / 2
      end
    end.lazy.find_index(1)
  end
end
