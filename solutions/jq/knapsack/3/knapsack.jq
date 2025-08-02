def maxVal($w; $wt; $val):
  .maxVals as $maxVals
  | .item as $item
  | [range($w + 1)]
  | map(
      $wt[$item - 1] as $currW
      | [
          $maxVals[.],
          if . >= $currW then
            $val[$item - 1] + $maxVals[. - $currW]
          else
            empty
          end
        ] | max
  )
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
    | [range($w + 1)]
    | map(0)
    | { maxVals: ., item: 1 }
    | maxVal($w; $wt; $val)
  end
