require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns weather' do
    weather = WeatherFacade.get_weather(lat,long)
    expect(lat_long).to be_a(Hash)
  end
end
