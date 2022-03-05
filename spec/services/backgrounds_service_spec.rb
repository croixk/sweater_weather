require 'rails_helper'

RSpec.describe BackgroundsService do

  describe 'Backgrounds service' do
    it '- can return hash that includes a url for an image' do
      results = BackgroundsService.get_image('denver,co')
      binding.pry
      expect(results).to be_a(Hash)

    end
  end
end
