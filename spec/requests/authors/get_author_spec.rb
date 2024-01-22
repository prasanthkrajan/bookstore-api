require 'rails_helper'

RSpec.describe 'Author', type: :request do
	describe 'GET /show' do
    before do
      get "/api/v1/authors/#{author_id}"
    end
    
    context 'and if data is present' do
      let(:author) { create(:author, :with_books) }
      let(:author_id) { author.id }
      
      it 'returns the preferred author' do
        expect(json['id']).to eq(author_id)
        expect(json['books']).to_not match_array([])
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'but if no data is present' do
      let(:author_id) { 'bogative' }

      it 'returns no author and renders status code 404' do
        expect(json['status']).to eql(404)
        expect(json['id']).to be_nil
      end
    end
  end
end