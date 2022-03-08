class BooksSerializer
  include JSONAPI::Serializer

  def self.return_books(location, weather, books, total_books_found)
    hash = {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": location,
          "forecast": {
            "summary": weather[:current][:weather][0][:description],
            # "temperature": ((weather[:current][:temp]-273.15)*9/5+32).to_i.to_s + " F"
            "temperature": weather[:current][:temp]
          },
          "total_books_found": total_books_found,
          "books": books.map do |book|
              {
                "isbn": book.isbn,
                "title": book.title,
                "publisher": book.publisher
              }
          end,
        }
      }
    }
  end
end
