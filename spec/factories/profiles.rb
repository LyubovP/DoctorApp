# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :profile do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    phone { Faker::Base.numerify('##########') }   
  end
end
