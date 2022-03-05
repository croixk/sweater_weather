class BackgroundsService
  def self.conn
    Faraday.new(url: 'https://api.pexels.com/v1/') do |faraday|
      faraday.headers['Authorization'] = ENV['pexels_key']
    end
  end

  def self.get_image(query)
    response = conn.get("search?query=#{query}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
