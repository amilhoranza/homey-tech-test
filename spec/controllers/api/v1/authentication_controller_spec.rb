require 'rails_helper'

RSpec.describe Api::V1::AuthenticationController, type: :request do
  describe 'POST #login' do
    let(:user) { create(:user, email: 'user@example.com', password: 'password123') }

    context 'with valid credentials' do
      it 'returns a JWT token' do
        post '/api/v1/auth/login', params: { email: user.email, password: 'password123' }, as: :json

        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid email' do
      it 'returns an error' do
        post '/api/v1/auth/login', params: { email: 'invalid@example.com', password: 'password123' }, as: :json

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Invalid credentials')
      end
    end

    context 'with invalid password' do
      it 'returns an error' do
        post '/api/v1/auth/login', params: { email: user.email, password: 'wrongpassword' }, as: :json

        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Invalid credentials')
      end
    end
  end
end
