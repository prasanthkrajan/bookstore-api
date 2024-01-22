require 'rails_helper'

RSpec.describe 'Books', type: :request do
	describe 'POST /create' do
    let(:author) { create(:author) }
		before do
      post "/api/v1/books", params: { book: create_params }
    end

		context 'when valid book attributes are present' do
      let(:create_params) do
      	{
      		title: 'A Gentleman in Moscow',
      		author_id: author.id,
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

    context 'when any one of the important attributes besides price is omitted' do
      context 'and the attribute is title' do
        let(:create_params) do
          {
            author_id: author.id,
            published_year: 2000,
            isbn_number: 'ISBN-250-250',
            price: 59.00
          }
        end

        it 'fails to create a book' do
          expect(Book.count).to eql(0)
          expect(json['details']['message']).to eq("Validation failed: Title can't be blank")
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'and the attribute is author' do
        let(:create_params) do
          {
            title: 'A Gentleman in Moscow',
            published_year: 2000,
            isbn_number: 'ISBN-250-250',
            price: 59.00
          }
        end
        
        it 'fails to create a book' do
          expect(Book.count).to eql(0)
          expect(json['details']['message']).to eq("Validation failed: Author must exist, Author can't be blank")
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'and the attribute is published_year' do
        let(:create_params) do
          {
            title: 'A Gentleman in Moscow',
            author_id: author.id,
            isbn_number: 'ISBN-250-250',
            price: 59.00
          }
        end
        
        it 'fails to create a book' do
          expect(Book.count).to eql(0)
          expect(json['details']['message']).to eq("Validation failed: Published year can't be blank")
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      context 'and the attribute is isbn_number' do
        let(:create_params) do
          {
            title: 'A Gentleman in Moscow',
            author_id: author.id,
            published_year: 2000,
            price: 59.00
          }
        end
        
        it 'fails to create a book' do
          expect(Book.count).to eql(0)
          expect(json['details']['message']).to eq("Validation failed: Isbn number can't be blank")
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when price is omitted from params' do
    	let(:create_params) do
      	{
      		title: 'A Gentleman in Moscow',
      		author_id: author.id,
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
      		author_id: author.id,
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
