require 'rails_helper'

RSpec.describe 'Books', type: :request do
	describe 'GET /show' do
    let(:book) { create(:book) }

    context 'and if data is present' do
      before do
        get "/api/v1/books/#{book.id}"
      end
      
      it 'returns the preferred book' do
        expect(json['id']).to eq(book.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'but if no data is present' do
      before do
        get "/api/v1/books/#{book.id + 1}"
      end
      
      it 'returns no book' do
        expect(json.size).to eq(0)
      end

      it 'returns status code 404' do
        expect(response).to raise_error
      end
    end
  end
end