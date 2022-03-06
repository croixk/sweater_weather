require 'rails_helper'

RSpec.describe BackgroundsFacade do
  it 'can return hash with background information' do
    json = BackgroundsFacade.get_image('denver,co')
    expect(lat_long).to be_a(Hash)
  end
end
