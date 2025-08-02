class LocomotiveEngineer
  def self.generate_list_of_wagons(*ids)
    ids
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    last1, last2, locomotive, *rest = each_wagons_id
    [locomotive, *missing_wagons, *rest, last1, last2]
  end

  def self.add_missing_stops(route, **rest)
    {from: route[:from], to: route[:to], stops: rest.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
