class BookFacade
  def self.get_books(query, book_quantity)
    json = BookService.get_books(query)
    total_books_found = json[:num_found]
    books_array = json[:docs].shift(book_quantity)
    ### add count for total books
    ### limit to correct number of books here?
    books_objects = books_array.map do |book_data|
      Book.new(book_data)
    end

  end
end
