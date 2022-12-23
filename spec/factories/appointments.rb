FactoryBot.define do
  factory :appointment do
    association :patient, factory: :user
    association :doctor, factory: :user    
    
    message       { Faker::Lorem.sentence(500) }
  end
end
