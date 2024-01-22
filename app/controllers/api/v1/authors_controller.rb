class Api::V1::AuthorsController < Api::V1::BaseController
	before_action :set_author, only: %i[show]

	include ErrorHandler	

	api :GET, '/v1/authors', 'To retrieve all authors'
	def index
		@authors ||= Author.all.includes(:books)
		paginate json: @authors, status: :ok
	end

	api :GET, '/v1/authors/:id', 'To retrieve a single author, by providing author ID'
  param :id, String, desc: 'Author ID', required: true
	def show
		render json: @author, status: :ok
	end

	private

	def set_author
		@author ||= Author.find(params[:id])
	end
end