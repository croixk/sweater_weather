class WeatherFacade
  def self.get_weather(lat,long)
    json = WeatherService.get_weather(lat,long)
    binding.pry
    weather = json
  end
end
