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
            "temperature": weather[:temp]
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
