class WeatherService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = ENV['one_call_weather_key']
    end
  end

  def self.get_weather(lat, long)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{long}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
