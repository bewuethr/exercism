module Grid
  def self.saddle_points(input)
    cols = input.transpose
    input.each_with_object([]).with_index do |(row, result), i|
      row.each_with_index do |height, j|
        result.push([i, j]) if row.max == height && cols[j].min == height
      end
    end.map { |c| {"row" => c[0] + 1, "column" => c[1] + 1} }
  end
end
