class Api::V1::BooksController < Api::V1::BaseController
	before_action :set_book, only: %i[show update destroy]	

	def index
		@books = Book.all
		render json: @books, status: :ok
	end

	def show
		render json: @book, status: :ok
	end

	def update
	end

	def create
	end

	def destroy
	end

	private

	def set_book
		@book ||= Book.find(params[:id])
	end
end