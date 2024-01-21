require 'rails_helper'

RSpec.describe 'Books', type: :request do
	describe 'POST /create' do
		before do
      post "/api/v1/books", params: { book: create_params }
    end

		context 'when valid book attributes are present' do
      let(:create_params) do
      	{
      		title: 'A Gentleman in Moscow',
      		author: 'Amor Towles',
      		published_year: 2000,
      		isbn_number: 'ISBN-250-250',
      		price: 59.00
      	}
      end

      it 'creates a book record successfully' do
      	expect(Book.count).to eql(1)
      	expect(json['title']).to eql(create_params[:title])
      end
    end

    context 'when price is omitted from params' do
    	let(:create_params) do
      	{
      		title: 'A Gentleman in Moscow',
      		author: 'Amor Towles',
      		published_year: 2000,
      		isbn_number: 'ISBN-250-250'
      	}
      end

      it 'still creates a book record successfully' do
      	expect(Book.count).to eql(1)
      	expect(json['title']).to eql(create_params[:title])
      	expect(json['price']).to be_nil
      end
    end

    context 'when isbn_number belongs to a book already added' do
    	let(:another_book) { create(:book) }
    	let(:create_params) do
      	{
      		title: 'A Gentleman in Moscow',
      		author: 'Amor Towles',
      		published_year: 2000,
      		isbn_number: another_book.isbn_number
      	}
      end

      it 'fails to create a book' do
      	expect(Book.count).to eql(1)
      	expect(json['details']['message']).to eq("Validation failed: Isbn number has already been taken")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
