class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def initialize(colors)
    @c1, @c2, @c3 = colors
  end

  def label
    r = [@c1, @c2].map { |c| COLORS.index(c) }.join + "0" * COLORS.index(@c3)
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
