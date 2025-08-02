class AssemblyLine
  HOURLY_BASE_RATE = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    rate = @speed * HOURLY_BASE_RATE
    if @speed <= 4
      rate
    elsif @speed <= 8
      rate * 0.9
    elsif @speed == 9
      rate * 0.8
    elsif @speed == 10
      rate * 0.77
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
