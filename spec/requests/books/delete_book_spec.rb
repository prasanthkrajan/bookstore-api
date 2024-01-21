require 'rails_helper'

RSpec.describe 'Books', type: :request do
	describe 'DELETE /destroy' do
		let(:book) { create(:book) }
		before do
      delete "/api/v1/books/#{book_id}"
    end

    context 'when deleting an existing book' do
    	let(:book_id) { book.id }

    	it 'deletes book successfully' do
    		expect(Book.count).to eql(0)
    	end
    end

    context 'when deleting a non-existing book' do
    	let(:book_id) { 'bogative' }

    	it 'does not delete anything and returns error' do
    		expect(json['status']).to eql(404)
        expect(json['details']['message']).to eql("Couldn't find Book with 'id'=bogative")
    	end
    end
 	end
end