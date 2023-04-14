require 'swagger_helper'
RSpec.describe 'api/login', type: :request do
  path '/api/v1/login' do
    post 'Login' do
      tags 'Login'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response '200', 'user logged in' do
        let(:user) { { email: 'hello1@gmail.com', password: 'password1' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:user) { { email: '', password: '' } }
        run_test!
      end
      response '404', 'user not found' do
        let(:user) { { email: 'invalid', password: 'invalid' } }
        run_test!
      end
    end
  end
end
