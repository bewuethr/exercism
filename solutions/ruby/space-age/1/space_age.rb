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

  def on_mercury = convert(:mercury)

  def on_venus = convert(:venus)

  def on_mars = convert(:mars)

  def on_jupiter = convert(:jupiter)

  def on_saturn = convert(:saturn)

  def on_uranus = convert(:uranus)

  def on_neptune = convert(:neptune)

  private def convert(planet)
    @earth_years / YEARS[planet]
  end
end
