FactoryBot.define do
  factory :book do
  	association :author
    title { Faker::Book.title }
    published_year { 2000 }
    isbn_number { "ISBN #{Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)}"}
    price { Faker::Number.decimal }
  end
end