require 'rails_helper'

RSpec.describe BackgroundsFacade do
  it 'can return hash with background information' do
    json = BackgroundsFacade.get_image('denver,co')
    expect(json).to be_a(Hash)
  end
end
