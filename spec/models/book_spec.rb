require 'rails_helper'

RSpec.describe Book, type: :model do
	let(:book) { create(:book) }

	it 'is valid with all valid attributes' do
		expect(book).to be_valid
	end

	it 'is not valid without a book title' do
		book_no_title = Book.new(book.attributes.merge({"title" => nil}))
    expect(book_no_title).to_not be_valid
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
