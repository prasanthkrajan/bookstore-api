# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Book.destroy_all
Author.destroy_all

10.times do |i|
	author = Author.create(name: Faker::Name.name, location: Faker::Address.city)
	10.times do |ii|
		Book.create(title: Faker::Book.title, 
								author: author, 
								published_year: Faker::Number.within(range: 1900..2023), 
								isbn_number: "ISBN #{Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)}", 
								price: Faker::Number.decimal)
	end
end