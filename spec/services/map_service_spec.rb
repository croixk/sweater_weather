require 'rails_helper'

RSpec.describe MapService do

  describe 'get latitude and longitude' do
    it '- can use city and state to get latitude and longitude information' do
      location = MapService.get_lat_long('denver,co')

      expect(location).to be_a(Hash)
      expect(location).to have_key(:results)
      expect(location[:results][0]).to have_key(:locations)
      expect(location[:results][0][:locations][0]).to have_key(:latLng)
    end
  end
end
