def construct:
  if .preorder | length == 0 then
    {}
  else
    .preorder as $preorder
    | (.inorder | index($preorder[0])) as $mid
    | {
        "v": .preorder[0],
        "l": {
          preorder: .preorder[1:$mid+1],
          inorder: .inorder[:$mid]
        } | construct,
        "r": {
          preorder: .preorder[$mid+1:],
          inorder: .inorder[$mid+1:]
        } | construct
      }
  end;

(.preorder | length) as $pl
| (.inorder | length) as $il
| if $pl != $il then
    "traversals must have the same length" | halt_error
  elif (.preorder | sort) != (.inorder | sort) then
    "traversals must have the same elements" | halt_error
  elif (((.preorder | unique | length) != $pl) or ((.inorder | unique | length) != $il)) then
    "traversals must contain unique items" | halt_error
  else
    construct
  end
