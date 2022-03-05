require 'rails_helper'

RSpec.describe WeatherService do

  describe 'Weather service' do
    it 'can retreive weather information' do
      weather = WeatherService.get_weather('39.73','-104.98')
      expect(weather).to be_a(Hash)
    end
  end
end
