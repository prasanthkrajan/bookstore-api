# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Book.create([
	{ title: 'A Gentleman in Moscow', author: 'Amor Towles', published_year: 2000, isbn_number: 'ISBN-20201', price: 15.00 },
	{ title: '11/22/63', author: 'Stephen King', published_year: 1990, isbn_number: 'ISBN-20202', price: 12.00 },
	{ title: 'How to Win', author: 'New Author', published_year: 2000, isbn_number: 'ISBN-20203', price: 15.00 },
	{ title: 'Life of Pi', author: 'Anonymous', published_year: 2010, isbn_number: 'ISBN-20204', price: 45.00 },
	{ title: 'Great Wall', author: 'Another Author', published_year: 2000, isbn_number: 'ISBN-20205', price: 37.00 }
])