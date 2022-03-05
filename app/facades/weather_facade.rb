class WeatherFacade
  def self.get_weather(lat,long)
    json = WeatherService.get_weather(lat,long)
    weather = json
  end
end
