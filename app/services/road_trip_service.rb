class RoadTripService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
    end
  end

  def self.get_directions(start, destination)
    response = conn.get("/directions/v2/route?from=#{start}&to=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
