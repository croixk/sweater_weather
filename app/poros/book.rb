class Book
  attr_reader :isbn, :title, :publisher

  def initialize(book_data, total_books_found)
    @isbn = book_data[:isbn]
    @title = book_data[:title]
    @publisher = book_data[:publisher]
    @total_books_found = total_books_found
  end
end
