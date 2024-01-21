class Book < ApplicationRecord
	validate_uniqueness_of :isbn_number
	validate_presence_of :title
end
