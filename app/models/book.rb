class Book < ApplicationRecord
	belongs_to :author
	validates_uniqueness_of :isbn_number
	validates_presence_of :title, :isbn_number, :author, :published_year
end
