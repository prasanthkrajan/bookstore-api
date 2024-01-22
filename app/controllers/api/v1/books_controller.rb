class Api::V1::BooksController < Api::V1::BaseController
	before_action :set_book, only: %i[show update destroy]

	include ErrorHandler	

	api :GET, '/v1/books', 'To retrieve all books'
	def index
		@books ||= Book.all
		render json: @books, status: :ok
	end

	api :GET, '/v1/books/:id', 'To retrieve a single book, by providing book ID'
  param :id, String, desc: 'Book ID', required: true
	def show
		render json: @book, status: :ok
	end

	# api :PUT, '/v1/books/:id', 'To update a single book, by providing book ID, and attributes to be updated'
	# param :id, String, desc: 'Book ID', required: true
 #  param :book, Hash, desc: 'Book info', required: true do
	#   param :title, String, desc: 'Title of book'
	#   param :author, String, desc: 'Author of book', required: false
	#   param :published_year, String, desc: 'Year book was published', required: false
	#   param :isbn_number, String, desc: 'ISBN number of book', required: false
	#   param :price, String, desc: 'Price of book', required: false
 #  end
	def update
		@book.update!(book_params)
		render json: @book, status: :ok
	end

	# api :POST, '/v1/books', 'To create a single book, by providing attributes required'
 #  param :title, String, desc: 'Title of book', required: true
 #  param :author, String, desc: 'Author of book', required: true
 #  param :published_year, String, desc: 'Year book was published', required: true
 #  param :isbn_number, String, desc: 'ISBN number of book', required: true
 #  param :price, String, desc: 'Price of book', required: false
	def create
		@book = Book.create!(book_params)
		render json: @book, status: :ok
	end

	api :DELETE, '/v1/books/:id', 'To delete a single book, by providing book ID'
  param :id, String, desc: 'Book ID', required: true
	def destroy
		@book.destroy
		head :no_content
	end

	def search
	end

	private

	def set_book
		@book ||= Book.find(params[:id])
	end

	def book_params
    params.require(:book).permit(:title,
    														 :author_id,
    														 :published_year,
    														 :isbn_number,
    														 :price,
    														 :id)
  end
end