class Api::V1::ForecastController < ApplicationController
  
  def show
    coordinates = MapFacade.lat_long(params[:location])
    weather = WeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])
    render json: ForecastSerializer.forecast(weather)
  end
end
