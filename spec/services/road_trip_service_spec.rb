require 'rails_helper'

RSpec.describe RoadTripService do

  describe 'mapquest api call' do
    it 'can return information regarding route' do
      data = RoadTripService.get_directions('Denver,CO', 'Bozeman,MT')

      expect(data).to be_a(Hash)
      expect(data).to have_key(:route)
      expect(data[:route]).to have_key(:formattedTime)
    end
  end
end
