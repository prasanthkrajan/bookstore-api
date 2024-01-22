require 'rails_helper'

RSpec.describe 'Books', type: :request do
	describe 'PUT /update' do
    let(:book) { create(:book) }

    context 'and if data is present' do
      let(:book_id) { book.id }
      before do
        put "/api/v1/books/#{book_id}", params: { book: update_params }
      end

      context 'and title is updated' do
        let(:update_params) { book.attributes.merge({ 'title' => new_title }) }

        context 'with a valid value' do
          let(:new_title) { 'New Book Title' }
          
          it 'returns the book with the latest title' do
            expect(json['title']).to eq(new_title)
          end

          it 'returns status code 200' do
            expect(response).to have_http_status(:success)
          end
        end

        context 'but if value is null' do
          let(:new_title) { }

          it 'does not change the book title' do
            expect(book.title).to_not eq(new_title)
          end

          it 'raises error and returns status code 422' do
            expect(json['details']['message']).to eq("Validation failed: Title can't be blank")
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end

      context 'and author is updated' do
        let(:new_author)    { create(:author)  }
        let(:update_params) { book.attributes.merge({ 'author_id' => new_author_id }) }

        context 'with a valid value' do
          let(:new_author_id) { new_author.id }
          
          it 'returns the book with the latest author' do
            expect(json['author']['id']).to eq(new_author.id)
            expect(json['author']['name']).to eq(new_author.name)
            expect(json['author']['location']).to eq(new_author.location)
          end

          it 'returns status code 200' do
            expect(response).to have_http_status(:success)
          end
        end

        context 'but if value is null' do
          let(:new_author_id) { }

          it 'does not change the book author' do
            expect(book.author).to_not eq(new_author)
          end

          it 'raises error and returns status code 422' do
            expect(json['details']['message']).to eq("Validation failed: Author must exist, Author can't be blank")
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end

      context 'and published_year is updated' do
        let(:update_params) { book.attributes.merge({ 'published_year' => new_published_year }) }

        context 'with a valid value' do
          let(:new_published_year) { 3000 }
          
          it 'returns the book with the latest published_year' do
            expect(json['published_year']).to eq(new_published_year)
          end

          it 'returns status code 200' do
            expect(response).to have_http_status(:success)
          end
        end

        context 'but if value is null' do
          let(:new_published_year) { }

          it 'does not change the book published_year' do
            expect(book.published_year).to_not equal(new_published_year)
          end

          it 'raises error and returns status code 422' do
            expect(json['details']['message']).to eq("Validation failed: Published year can't be blank")
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end

      context 'and isbn_number is updated' do
        let(:update_params) { book.attributes.merge({ 'isbn_number' => new_isbn_number }) }

        context 'with a valid value' do
          let(:new_isbn_number) { 'ISBN-909090909090' }
          
          it 'returns the book with the latest isbn_number' do
            expect(json['isbn_number']).to eq(new_isbn_number)
          end

          it 'returns status code 200' do
            expect(response).to have_http_status(:success)
          end
        end

        context 'but with isbn_number of another book' do
          let(:another_book)    { create(:book) }
          let(:new_isbn_number) { another_book.isbn_number }

          it 'does not change the book isbn_number' do
            expect(book.isbn_number).to_not equal(new_isbn_number)
          end

          it 'raises error and returns status code 422' do
            expect(json['details']['message']).to eq("Validation failed: Isbn number has already been taken")
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end

        context 'but if value is null' do
          let(:new_isbn_number) { }

          it 'does not change the book isbn_number' do
            expect(book.isbn_number).to_not equal(new_isbn_number)
          end

          it 'raises error and returns status code 422' do
            expect(json['details']['message']).to eq("Validation failed: Isbn number can't be blank")
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end
    end

    context 'but if no data is present' do
      let(:book_id) { 'bogative' }
      before do
        get "/api/v1/books/#{book_id}"
      end
      
      it 'returns no book and renders status code 404' do
        expect(json['status']).to eql(404)
        expect(json['id']).to be_nil
      end
    end
  end
end