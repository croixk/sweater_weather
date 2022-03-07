class Api::V1::BooksController < ApplicationController
  def search
    location = params[:location]
    book_quantity = params[:quantity].to_i

    coordinates = MapFacade.lat_long(params[:location])
    weather = WeatherFacade.get_weather(coordinates[:lat], coordinates[:lng])
    ### Add books facade call - include quantity
    books = BookFacade.get_books(location, book_quantity)
    total_books_found = books[0].total_books_found

    render json: BooksSerializer.return_books(weather, books, total_books_found)
  end
end
