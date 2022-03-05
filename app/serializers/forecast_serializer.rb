class ForecastSerializer
  include JSONAPI::Serializer

  def self.forecast(data)
    binding.pry
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
          daily_weather:{
            date: data[:daily][:dt],
            sunrise: data[:daily][:sunrise],
            sunset: data[:daily][:sunset],
            sunset: data[:daily][:sunset],
            max_temp: data[:daily][:max_temp],
            min_temp: data[:daily][:min_temp],
            conditions: data[:daily][:conditions],
            icon: data[:daily][:icon]
          },
          hourly_weather:{
            time: data[:hourly][:time],
            temperature: data[:hourly][:temperature],
            conditions: data[:hourly][:conditions],
            icon: data[:hourly][:icon]
          }
        }
      }
    }
  end
end
