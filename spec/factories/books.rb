FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    published_year { 2000 }
    isbn_number { "ISBN #{Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3)}"}
    price { Faker::Number.decimal }
  end
end