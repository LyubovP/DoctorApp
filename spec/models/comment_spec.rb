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
require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:appointment) }
  it { should belong_to(:user) }
  it { should have_rich_text(:body) }
end
