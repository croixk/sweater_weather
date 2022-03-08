require 'rails_helper'

RSpec.describe 'Road trip request' do
  it 'sends a post request' do
    body =
    {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }

    post '/api/v1/road_trip', params: body, as: :json
    road_trip_return = JSON.parse(response.body, symbolize_names: true)

    binding.pry

    expect(response).to be_successful

    expect(road_trip_return).to have_key(:data)
    expect(road_trip_return[:data]).to have_key(:id)
    expect(road_trip_return[:data]).to have_key(:type)
    expect(road_trip_return[:data][:type]).to eq("roadtrip")
    expect(road_trip_return[:data]).to have_key(:attributes)
    expect(road_trip_return[:data][:attributes]).to have_key(:start_city)
    expect(road_trip_return[:data][:attributes]).to have_key(:end_city)
    expect(road_trip_return[:data][:attributes]).to have_key(:travel_time)
    expect(road_trip_return[:data][:attributes]).to have_key(:weather_at_eta)
  end
end
