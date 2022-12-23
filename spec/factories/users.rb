FactoryBot.define do
  factory :patient, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    admin { false}
    type { "Patient" }
  end
  factory :doctor, class: User do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    admin { false}
    type { "Doctor" }
  end
end
