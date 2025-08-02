class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def initialize(colors)
    @vals, @zeroes = [colors[...2], colors.last]
  end

  def label
    r = @vals.map { |c| COLORS.index(c) }.join + "0" * COLORS.index(@zeroes)
    "Resistor value: #{si_convert(r.to_i)}"
  end

  private def si_convert(r)
    q = r.div(1000)
    if q > 0
      "#{q} kiloohms"
    else
      "#{r} ohms"
    end
  end
end
