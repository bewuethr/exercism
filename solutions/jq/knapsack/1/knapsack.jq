def maxVal($w; $wt; $val):
  # debug
  .maxVals as $maxVals
  | .item as $item
  | [range($w + 1)]
  # | debug
  | map(
      $maxVals[.] as $maxValWithoutCurr
      | $wt[$item - 1] as $currW
      | if . >= $currW then
          [$val[$item - 1] + $maxVals[. - $currW], $maxValWithoutCurr] | max
        else
          $maxValWithoutCurr
        end
  )
  # | debug
  | if $item == ($wt | length) then
      last
    else
      { maxVals: ., item: ($item + 1) }
      | maxVal($w; $wt; $val)
    end
  ;

.maximumWeight as $w
| .items
| if length == 0 then
    0
  else
    map(.weight) as $wt
    | map(.value) as $val
    # | {wt: $wt, val: $val, w: $w } | debug
    | [range($w + 1)]
    | map(0)
    | { maxVals: ., item: 1 }
    | maxVal($w; $wt; $val)
  end
