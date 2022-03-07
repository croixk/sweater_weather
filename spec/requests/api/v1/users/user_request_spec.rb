require 'rails_helper'

RSpec.describe 'Users' do
  describe 'create users' do
    it 'creates a user if valid data is given' do
      user = {
        email: '2testemail@gmail.com',
        password: 'test_password',
        password_confirmation: 'test_password'
      }

      post '/api/v1/users', params: user, as: :json

      return_user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(return_user).to have_key(:data)
      expect(return_user[:data]).to have_key(:type)
      expect(return_user[:data]).to have_key(:id)
      expect(return_user[:data]).to have_key(:attributes)
      expect(return_user[:data][:attributes]).to have_key(:email)
      expect(return_user[:data][:attributes]).to have_key(:api_key)
    end

    xit 'creates a user if valid data is given' do
      user = {
        email: '2testemail@gmail.com',
        password: 'test_password',
        password_confirmation: 'does not match'
      }

      post '/api/v1/users', params: user, as: :json

      return_user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful

    end
  end
end
