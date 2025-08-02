class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute.div(60)).modulo(24)
    @minute = minute.modulo(60)
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    "%02d:%02d" % [@hour, @minute]
  end
end
