module Gigasecond
  def self.from(time)
    Time.at(time.to_i + 1e9)
  end
end
