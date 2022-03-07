class Book
  attr_reader :isbn, :title, :publisher

  def initialize(book_data)
    @isbn = book_data[:isbn]
    @title = book_data[:title]
    @publisher = book_data[:publisher]
  end
end
