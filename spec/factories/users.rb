FactoryBot.define do
  factory :user , aliases: [:doctor, :patient] do
    email { Faker::Internet.email }
    password_digest {BCrypt::Password.create("123456")}
    admin { [UserAdmin::FALSE] }
  end
end
