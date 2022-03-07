require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns book objects' do
    books = BookFacade.get_books("denver,co")
    expect(books).to be_a(Array)
    books.each do |book|
      expect(book).to be_a(Book)
    end

  end
end
