FactoryBot.define do
  factory :user , aliases: [:doctor, :patient] do
    email { Faker::Internet.email }
    password_digest {BCrypt::Password.create("123456")}
    role { [UserRole::PATIENT] }
    admin { [UserAdmin::FALSE] }
  end
  trait :doctor do
    role { [UserRoles::DOCTOR] }
  end
end
