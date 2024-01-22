require 'rails_helper'

RSpec.describe 'Authors', type: :request do
	describe 'GET /index' do
    context 'and if data is present' do
      before do
        create_list(:author, 10)
        get '/api/v1/authors'
      end
      
      it 'returns all authors' do
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'but if no data is present' do
      before do
        get '/api/v1/authors'
      end
      
      it 'returns no author' do
        expect(json.size).to eq(0)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end