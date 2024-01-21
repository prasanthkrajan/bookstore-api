class Book < ApplicationRecord
	validates_uniqueness_of :isbn_number
	validates_presence_of :title
end
