require 'rails_helper'

RSpec.describe 'Books', type: :request do
	describe 'GET /show' do
    before do
      get "/api/v1/books/#{book_id}"
    end
    
    context 'and if data is present' do
      let(:book) { create(:book) }
      let(:book_id) { book.id }
      
      it 'returns the preferred book' do
        expect(json['id']).to eq(book.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'but if no data is present' do
      let(:book_id) { 'bogative' }

      it 'returns no book and renders status code 404' do
        expect(json['status']).to eql(404)
        expect(json['id']).to be_nil
      end
    end
  end
end