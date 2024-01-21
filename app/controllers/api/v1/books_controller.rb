class Api::V1::BooksController < Api::V1::BaseController
	include ErrorHandler

	before_action :set_book, only: %i[show update destroy]	

	def index
		@books = Book.all
		render json: @books, status: :ok
	end

	def show
		render json: @book, status: :ok
	end

	def update
		@book.update!(book_params)
		render json: @book, status: :ok
	end

	def create
		@book = Book.create!(book_params)
		render json: @book, status: :ok
	end

	def destroy
		@book.destroy
		head :no_content
	end

	private

	def set_book
		@book ||= Book.find(params[:id])
	end

	def book_params
    params.require(:book).permit(:title,
    														 :author,
    														 :published_year,
    														 :isbn_number,
    														 :price)
  end
end