require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns weather' do
    weather = WeatherFacade.get_weather('39.73','-104.98')
    expect(weather).to be_a(Hash)
    expect(weather).to have_key(:current)
    expect(weather).to have_key(:hourly)
    expect(weather).to have_key(:daily)
  end
end
