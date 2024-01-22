FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    location { Faker::Address.city }

    trait :with_books do
    	books { build_list :book, 5 }
    end
  end
end