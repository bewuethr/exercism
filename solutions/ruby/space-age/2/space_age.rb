class SpaceAge
  SECONDS_IN_EARTH_YEAR = 31_557_600.0

  YEARS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  def initialize(seconds)
    @earth_years = seconds / SECONDS_IN_EARTH_YEAR
  end

  def on_earth
    @earth_years
  end

  YEARS.keys.each do |key|
    define_method(("on_" + key.to_s).to_sym) { @earth_years / YEARS[key] }
  end
end
