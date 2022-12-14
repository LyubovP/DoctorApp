FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    phone { Faker::PhoneNumber.phone_number }    
  end
end
