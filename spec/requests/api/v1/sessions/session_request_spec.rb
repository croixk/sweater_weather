require 'rails_helper'

RSpec.describe 'Session requests' do
  describe 'happy path' do
    it 'sends a session request to log in' do
      login = {
        email: "testemail@gmail.com",
        password: "testpassword"
      }

      user = User.create(email: "testemail@gmail.com", password: "testpassword")

      post '/api/v1/sessions', params: login, as: :json

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(data[:data]).to have_key(:type)
      expect(data[:data]).to have_key(:id)
      expect(data[:data]).to have_key(:attributes)
      expect(data[:data][:attributes]).to have_key(:email)
      expect(data[:data][:attributes]).to have_key(:api_key)
    end
  end

  describe 'sad path' do
    it 'sends incorrect password' do
      login = {
        email: "testemail@gmail.com",
        password: "nottherightpassword"
      }

      user = User.create(email: "testemail@gmail.com", password: "testpassword")

      post '/api/v1/sessions', params: login, as: :json

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(data).to have_key(:data)
      expect(data[:data]).to have_key(:error)
      expect(data[:data][:error]).to eq("Incorrect login credentials")
    end

    it 'sends non existent email address' do
      login = {
        email: "wrongemail@gmail.com",
        password: "testpassword"
      }

      user = User.create(email: "testemail@gmail.com", password: "testpassword")

      post '/api/v1/sessions', params: login, as: :json

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(data).to have_key(:data)
      expect(data[:data]).to have_key(:error)
      expect(data[:data][:error]).to eq("Incorrect login credentials")
    end
  end
end
