.legacy
| to_entries
| map(
  {(.key): (.value[] | ascii_downcase)}
  | with_entries({key: .value, value: .key | tonumber}))
| sort
| add
