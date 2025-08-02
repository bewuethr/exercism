module Raindrops
  def self.convert(n)
    a = ""
    a += "Pling" if n % 3 == 0
    a += "Plang" if n % 5 == 0
    a += "Plong" if n % 7 == 0
    a.empty? ? n.to_s : a
  end
end
