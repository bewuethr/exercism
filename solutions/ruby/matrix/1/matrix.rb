class Matrix
  def initialize(input)
    @matrix = input.split("\n").map { |row| row.split.map(&:to_i) }
  end

  def row(idx)
    @matrix[idx - 1]
  end

  def column(idx)
    @matrix.map { |row| row[idx - 1] }
  end
end
