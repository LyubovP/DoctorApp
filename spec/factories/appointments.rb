# == Schema Information
#
# Table name: appointments
#
#  id         :bigint           not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :bigint
#  patient_id :bigint
#
FactoryBot.define do
  factory :appointment do
    association :patient, factory: :user
    association :doctor, factory: :user    
    
    message       { Faker::Lorem.sentence(500) }
  end
end
