require 'rails_helper'

RSpec.describe 'Book search' do
  it 'provides information on books about a city, as well as weather and the city name' do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:destination)
    expect(data[:attributes]).to have_key(:forecast)
    expect(data[:attributes][:forecast]).to have_key(:summary)
    expect(data[:attributes][:forecast]).to have_key(:temperature)
    expect(data[:attributes]).to have_key(:total_books_found)
    expect(data[:attributes]).to have_key(:books)

    expect(data[:attributes][:books]).to be_a(Array)
    expect(data[:attributes][:books].count).to eq(5)

    expect(data[:attributes][:books][0]).to have_key(:isbn)
    expect(data[:attributes][:books][0]).to have_key(:title)
    expect(data[:attributes][:books][0]).to have_key(:publisher)



  end
end
