class BookFacade
  def self.get_books(query)
    json = BookService.get_books(query)
    ### add count for total books
    ### limit to correct number of books here? 
    json[:docs].map do |book_data|
      Book.new(book_data)
    end
  end
end
