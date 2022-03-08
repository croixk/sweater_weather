require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'returns information on trip length' do
    data = RoadTripFacade.get_directions("Denver,CO", "Bozeman,MT")
    expect(data).to be_a(Integer)
    
  end
end
