require 'swagger_helper'
RSpec.describe 'api/comments', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :post_id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: %w[text]
      }
      response '201', 'comment created' do
        let(:user_id) { User.first.id }
        let(:post_id) { Post.first.id }
        let(:comment) { { text: 'Comment text' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:user_id) { User.first.id }
        let(:post_id) { Post.first.id }
        let(:comment) { { text: '' } }
        run_test!
      end
      response '404', 'post not found' do
        let(:user_id) { 'invalid' }
        let(:post_id) { 'invalid' }
        let(:comment) { { text: 'Comment text' } }
        run_test!
      end
    end
  end
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    get 'show all comments' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :post_id, in: :path, type: :string
      parameter name: :user_id, in: :path, type: :string
      response '200', 'show all comments' do
        let(:user_id) { User.first.id }
        let(:post_id) { Post.first.id }
        run_test!
      end
      response '404', 'post not found' do
        let(:user_id) { 'invalid' }
        let(:post_id) { 'invalid' }
        run_test!
      end
    end
  end
end
