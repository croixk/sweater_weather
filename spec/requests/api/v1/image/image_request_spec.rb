require 'rails_helper'

RSpec.describe 'Image API' do
  describe 'happy path' do
    it 'fetches an image for a background' do
      get '/api/v1/backgrounds?location=denver,co'

      expect(response).to be_successful
      image_data = JSON.parse(response.body, symbolize_names: true)
      expect(image_data).to be_a(Hash)
      expect(image_data[:data]).to have_key(:type)
      expect(image_data[:data]).to have_key(:id)
      expect(image_data[:data]).to have_key(:attributes)
      expect(image_data[:data][:attributes]).to have_key(:image)
      expect(image_data[:data][:attributes][:image]).to have_key(:location)
      expect(image_data[:data][:attributes][:image]).to have_key(:image_url)
      expect(image_data[:data][:attributes][:image]).to have_key(:credit)
      expect(image_data[:data][:attributes][:image][:credit]).to have_key(:photographer)
      expect(image_data[:data][:attributes][:image][:credit]).to have_key(:photographer_url)
      expect(image_data[:data][:attributes][:image][:credit]).to have_key(:photographer_id)
    end
  end

  describe 'sad path' do
    it 'returns 404 if a location is not provided' do
      get '/api/v1/backgrounds?location=sldkdsicx'
      expect(response).to_not be_successful
      expect(status).to eq(404)

    end
  end
end
