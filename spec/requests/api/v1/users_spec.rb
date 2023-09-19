require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST #create' do
    context 'when user is valid' do
      let(:valid_user_params) do
        {
          name: 'John',
          last_name: 'Doe',
          email: 'john.doe@example.com',
          password: 'password123',
          password_confirmation: 'password123'
        }
      end

      it 'creates a new user' do
        expect {
          post :create, params: valid_user_params
        }.to change(User, :count).by(1)
      end

      it 'returns a 201 Created status' do
        post :create, params: valid_user_params
        expect(response).to have_http_status(:created)
      end

      it 'returns the auth_token in the response' do
        post :create, params: valid_user_params
        expect(JSON.parse(response.body)['auth_token']).to be_present
      end
    end

    context 'when user is not valid' do
      let(:invalid_user_params) do
        {
          name: '', # Name is required, so this will be invalid
          last_name: 'Doe',
          email: 'invalid-email', # Invalid email format
          password: 'password123',
          password_confirmation: 'password456' # Passwords don't match
        }
      end

      it 'does not create a new user' do
        expect {
          post :create, params: invalid_user_params
        }.to_not change(User, :count)
      end

      it 'returns a 422 Unprocessable Entity status' do
        post :create, params: invalid_user_params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors in the response' do
        post :create, params: invalid_user_params
        expect(JSON.parse(response.body)['errors']).to be_present
      end
    end
  end
end