require 'rails_helper'

RSpec.describe BookService do

  describe 'Book search' do
    it 'can return books that match certain criteria' do
      books = BookService.get_books("denver,co")

      expect(books).to be_a(Hash)
      expect(books).to have_key(:numFound)
      expect(books).to have_key(:start)
      expect(books).to have_key(:numFoundExact)
      expect(books).to have_key(:docs)
      expect(books[:docs]).to be_a(Array)
      expect(books[:docs][0]).to have_key(:key)
      expect(books[:docs][0]).to have_key(:type)
      expect(books[:docs][0]).to have_key(:seed)

    end
  end
end
