require 'rails_helper'

RSpec.describe 'Book search' do
  it 'provides information on books about a city, as well as weather and the city name' do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to be_a(Hash)
    expect(data).to have_key(:data)
    expect(data[:data]).to be_a(Hash)
    expect(data[:data]).to have_key(:id)
    expect(data[:data][:id]).to eq("null")
    expect(data[:data]).to have_key(:type)
    expect(data[:data][:type]).to eq("books")
    expect(data[:data]).to have_key(:attributes)
    expect(data[:data][:attributes]).to have_key(:destination)
    expect(data[:data][:attributes][:destination]).to be_a(String)
    expect(data[:data][:attributes]).to have_key(:forecast)
    expect(data[:data][:attributes][:forecast]).to have_key(:summary)
    expect(data[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(data[:data][:attributes][:forecast]).to have_key(:temperature)
    #
    expect(data[:data][:attributes]).to have_key(:total_books_found)
    expect(data[:data][:attributes][:total_books_found]).to be_a(Integer)
    expect(data[:data][:attributes]).to have_key(:books)

    expect(data[:data][:attributes][:books]).to be_a(Array)
    expect(data[:data][:attributes][:books].count).to eq(5)

    expect(data[:data][:attributes][:books][0]).to have_key(:isbn)
    expect(data[:data][:attributes][:books][0]).to have_key(:title)
    expect(data[:data][:attributes][:books][0]).to have_key(:publisher)

  end
end
