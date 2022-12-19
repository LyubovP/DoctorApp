FactoryBot.define do
  factory :appointment do
    patient
    doctor
    message { Faker::Hipster.sentence(500) }
  end
end
