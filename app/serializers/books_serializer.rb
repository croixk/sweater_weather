class BooksSerializer
  include JSONAPI::Serializer

  def self.return_books(weather, books, total_books_found)
    hash = {
      test: 'test'
    }
  end
end
