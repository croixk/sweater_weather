class Api::V1::RoadTripController < ApplicationController
  def show
    origin = params[:origin]
    destination = params[:destination]
    driving_time = RoadTripFacade.get_directions(origin, destination)

    coordinates = MapFacade.lat_long(destination)
    weather_at_eta = WeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])

    render json: RoadTripSerializer.road_trip(origin, destination, driving_time, weather_at_eta)
  end
end
