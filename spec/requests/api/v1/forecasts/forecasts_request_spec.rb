require 'rails_helper'

RSpec.describe 'Forecast API' do
  it 'sends a forecast' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to have_key(:data)

    expect(forecast[:data][:id]).to eq(null)

    expect(forecast[:data]).to have_key(:attributes)

    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Float).or(Integer)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(forecast[:data][:attributes][:current_weather][:uvi]).to be_a(Float).or(Integer)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(forecast[:data][:attributes][:current_weather][:visibility]).to be_a(Float).or(Integer)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:current_weather][:icon]).to be_a(String)

    expect(forecast[:data][:attributes]).to have_key(:daily_weather)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:date)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:sunrise)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:sunset)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:max_temp)
    expect(forecast[:data][:attributes][:daily_weather][:max_temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:min_temp)
    expect(forecast[:data][:attributes][:daily_weather][:min_temp]).to be_a(Float)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:daily_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:daily_weather][:max_temp]).to be_a(String)

    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:time)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:temperature)
    expect(forecast[:data][:attributes][:hourly_weather][:temperature]).to be_a(Float)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:conditions)
    expect(forecast[:data][:attributes][:hourly_weather]).to have_key(:icon)
    expect(forecast[:data][:attributes][:hourly_weather][:icon]).to be_a(String)

  end
end
