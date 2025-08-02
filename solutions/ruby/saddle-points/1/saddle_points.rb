module Grid
  def self.saddle_points(input)
    result = []
    input.each.with_index do |row, i|
      row.each_index do |j|
        result.push([i, j]) if tallest_in_row?(row, j) && shortest_in_col?(input.map { _1[j] }, i)
      end
    end

    result.map { |c| {"row" => c[0] + 1, "column" => c[1] + 1} }
  end

  private_class_method def self.tallest_in_row?(row, idx)
    row.max == row[idx]
  end

  private_class_method def self.shortest_in_col?(col, idx)
    col.min == col[idx]
  end
end
