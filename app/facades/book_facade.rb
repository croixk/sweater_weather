class BookFacade
  def self.get_books(query, book_quantity)
    json = BookService.get_books(query)
    total_books_found = json[:numFound]
    books_array = json[:docs].shift(book_quantity)
    books_objects = books_array.map do |book_data|
      Book.new(book_data, total_books_found)
    end
  end
end
