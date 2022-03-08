class RoadTripSerializer
  include JSONAPI::Serializer

  def self.road_trip(origin, destination, driving_time, weather_at_eta)
    hash = {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: origin,
        end_city: destination,
          travel_time: self.travel_time(driving_time),
          weather_at_eta: {
            temperature: 59.4,
            conditions: self.get_conditions_at_arrival(weather_at_eta, driving_time)
          }
        }
      }
    }
  end

  def self.travel_time(driving_time)
    hours = driving_time.slice(0..1).to_i
    minutes = driving_time.slice(3..4).to_i
    "#{hours} hours, #{minutes} minutes"
  end

  def self.travel_time_rounded(driving_time)
    hours = driving_time.slice(0..1).to_i
    minutes = driving_time.slice(3..4).to_i
    if minutes > 30
      return hours + 1
    else
      return hours
    end
  end

  def self.get_conditions_at_arrival(weather_at_eta, driving_time)
    hours = self.travel_time_rounded(driving_time)

    if hours <= 48
      return weather_at_eta[:hourly][hours.to_i][:weather][0][:main]
    else
      days = hours/24
      # weather = weather in how many days
      return weather_at_eta[:daily][days][:weather][0][:main]
    end

  end

  def self.get_temp_at_arrival(driving_time)
    hours = self.travel_time_rounded(driving_time)

    if hours <= 48
      return weather_at_eta[:hourly][hours][:temp]
    else
      days = hours/24
      # weather = weather in how many days
      return weather_at_eta[:daily][days][:temp]
    end
  end
end
