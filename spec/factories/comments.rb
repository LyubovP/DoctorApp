# == Schema Information
#
# Table name: comments
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  appointment_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_comments_on_appointment_id  (appointment_id)
#  index_comments_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (appointment_id => appointments.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :comment do
    appointment { nil }
    user { nil }
  end
end
