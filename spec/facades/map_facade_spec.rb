require 'rails_helper'

RSpec.describe MapFacade do
  it 'returns latitude and longitude' do
    lat_long = MapFacade.lat_long('denver,co')
    expect(lat_long).to be_a(Hash)
  end
end
