class BookService
  def self.conn
    Faraday.new(url: 'http://openlibrary.org') do |faraday|
    end
  end

  def self.get_books(query)
    response = conn.get("/search.json?title=#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
