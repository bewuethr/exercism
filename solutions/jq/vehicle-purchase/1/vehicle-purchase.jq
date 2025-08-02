def needs_license:
  . == "car" or . == "truck";

def choose_vehicle:
  (if .[0] < .[1] then .[0] else .[1] end) as $choice
  | $choice + " is clearly the better choice.";

def resell_price:
  (if .age < 3 then 0.8
  elif .age > 10 then 0.5
  else 0.7
  end) as $factor
  | $factor * .original_price;
