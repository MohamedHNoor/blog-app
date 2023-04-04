require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it('is correct template rendered') do
      expect(response).to render_template(:index)
    end

    it('is response body includes correct placeholder text') do
      expect(response.body).to include('index method')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/:user_id/posts/:post_id' }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it('is correct template rendered') do
      expect(response).to render_template(:show)
    end

    it('is response body includes correct placeholder text') do
      expect(response.body).to include('show method')
    end
  end
end
