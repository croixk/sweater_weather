require 'rails_helper'

RSpec.describe 'Session requests' do
  it 'sends a session request to log in' do
    login = {
      email: "testemail@gmail.com",
      password: "testpassword"
    }

    user = User.create(email: "testemail@gmail.com", password: "testpassword")

    post '/api/v1/sessions', params: login, as: :json

    login_return = JSON.parse(response.body, symbolize_names: true)

    binding.pry

    expect(response).to be_successful


  end
end
