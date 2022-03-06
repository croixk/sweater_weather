class ForecastSerializer
  include JSONAPI::Serializer

  def self.forecast(data)
    hash = {
      data:{
        id: nil,
        type: "forecast",
        attributes:{
          current_weather:{
            datetime: data[:current][:dt],
            sunrise: data[:current][:sunrise],
            sunset: data[:current][:sunset],
            temperature: data[:current][:temp],
            feels_like: data[:current][:feels_like],
            humidity: data[:current][:humidity],
            uvi: data[:current][:uvi],
            visibility: data[:current][:visibility],
            conditions: data[:current][:weather][0][:description],
            icon: data[:current][:weather][0][:icon]
          },
          daily_weather: data[:daily].shift(5).map do |day|
            {
              date: day[:dt],
              sunrise: day[:sunrise],
              sunset: day[:sunset],
              max_temp: day[:temp][:max],
              min_temp: day[:temp][:min],
              conditions: day[:conditions],
              icon: day[:icon]
            }
            end,
          hourly_weather: data[:hourly].shift(8).map do |hour|
            {
              time: Time.at(hour[:dt]),
              temperature: hour[:temp],
              conditions: hour[:weather][0][:description],
              icon: hour[:weather][0][:icon]
            }
            end,
        }
      }
    }
  end
end
