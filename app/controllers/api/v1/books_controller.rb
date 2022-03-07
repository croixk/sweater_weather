class Api::V1::BooksController < ApplicationController
  def search
    binding.pry
    location = params[:location]
    book_quantity = params[:quantity]

    coordinates = MapFacade.lat_long(params[:location])
    weather = WeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])
    ### Add books facade call - include quantity
    books = BookFacade.get_books(query, book_quantity)


    render json: ForecastSerializer.forecast(weather, books)
  end
end
