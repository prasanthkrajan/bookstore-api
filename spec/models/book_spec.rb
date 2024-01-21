require 'rails_helper'

RSpec.describe Book, type: :model do
	let(:book) { create(:book) }

	it 'is valid with all valid attributes' do
		expect(book).to be_valid
	end

	it 'is not valid without a book title' do
		invalid_book = Book.new(book.attributes.merge({"title" => nil}))
    expect(invalid_book).to_not be_valid
	end

	it 'is not valid without a book author' do
		invalid_book = Book.new(book.attributes.merge({"author" => nil}))
    expect(invalid_book).to_not be_valid
	end

	it 'is not valid without a book published_year' do
		invalid_book = Book.new(book.attributes.merge({"published_year" => nil}))
    expect(invalid_book).to_not be_valid
	end

	it 'is not valid without a book isbn_number' do
		invalid_book = Book.new(book.attributes.merge({"isbn_number" => nil}))
    expect(invalid_book).to_not be_valid
	end

	it 'is not valid with a duplicated ISBN number' do
		book_with_duplicated_isbn = Book.new(book.attributes)
		expect(book_with_duplicated_isbn).to_not be_valid
	end

	it 'is valid with other duplicated attributes besides ISBN' do
		valid_book = Book.new(book.attributes.merge({"isbn_number" => "some-other-random-isbn"}))
		expect(valid_book).to be_valid
	end
end
