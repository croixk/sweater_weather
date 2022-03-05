require 'rails_helper'

RSpec.describe 'Image API' do
  it 'fetches an image for a background' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    image_data = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    # forecast = JSON.parse(response.body, symbolize_names: true)

  end
end
