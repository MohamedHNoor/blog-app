require 'swagger_helper'
RSpec.describe 'api/posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    get 'show all posts' do
      tags 'Posts'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      response '200', 'show all posts' do
        let(:user_id) { User.first.id }
        run_test!
      end
      response '404', 'user not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end
    end
  end
end
