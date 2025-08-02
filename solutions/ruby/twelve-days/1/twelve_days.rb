class TwelveDays
  ORDINALS = {
    1 => "first",
    2 => "second",
    3 => "third",
    4 => "fourth",
    5 => "fifth",
    6 => "sixth",
    7 => "seventh",
    8 => "eighth",
    9 => "ninth",
    10 => "tenth",
    11 => "eleventh",
    12 => "twelfth"
  }

  GIFTS = {
    1 => "a Partridge in a Pear Tree",
    2 => "two Turtle Doves",
    3 => "three French Hens",
    4 => "four Calling Birds",
    5 => "five Gold Rings",
    6 => "six Geese-a-Laying",
    7 => "seven Swans-a-Swimming",
    8 => "eight Maids-a-Milking",
    9 => "nine Ladies Dancing",
    10 => "ten Lords-a-Leaping",
    11 => "eleven Pipers Piping",
    12 => "twelve Drummers Drumming"
  }

  def self.song
    (1..12).map { |n| "#{start(ORDINALS[n])}: #{gifts(n)}." }.join("\n\n") + "\n"
  end

  private_class_method def self.start(str)
    "On the #{str} day of Christmas my true love gave to me"
  end

  private_class_method def self.gifts(n)
    GIFTS.to_a[0, n].reverse.map { _1[1] }.join(", ").sub(/.*\K,/, ", and")
  end
end
