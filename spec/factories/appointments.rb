FactoryBot.define do
  factory :appointment do
    message { Faker::Hipster.sentence(500) }
  end
end
