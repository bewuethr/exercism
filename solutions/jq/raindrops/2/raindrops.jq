.number as $in
| ""
| if ($in % 3 == 0) then "Pling" else . end
| if ($in % 5 == 0) then . + "Plang" else . end
| if ($in % 7 == 0) then . + "Plong" else . end
| if . == "" then $in else . end
