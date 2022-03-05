require 'rails_helper'

RSpec.describe BackgroundsFacade do
  it '##############' do
    json = BackgroundsFacade.get_image('denver,co')
    binding.pry
    expect(lat_long).to be_a(Hash)
  end
end
