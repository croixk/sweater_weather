class RoadTripFacade
  def self.get_directions(start, destination)
    data = RoadTripService.get_directions(start, destination)
    trip_length = data[:route][:formattedTime]
  end
end
