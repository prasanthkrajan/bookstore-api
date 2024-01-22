FactoryBot.define do
  factory :author do
    name { Faker::Name.name}
    location { Faker::Address.city }
  end
end