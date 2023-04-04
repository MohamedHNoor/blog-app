require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }

    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:ok)
    end

    it('is correct template rendered') do
      expect(response).to render_template(:index)
    end

    it('is response body includes correct placeholder text') do
      expect(response.body).to include('List of users in index method')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/:user_id' }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it('is correct template rendered') do
      expect(response).to render_template(:show)
    end

    it('is response body includes correct placeholder text') do
      expect(response.body).to include('Single user in show method')
    end
  end
end
