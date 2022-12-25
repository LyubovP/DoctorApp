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
require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }

  context 'validation tests' do
    it 'ensures first name presence' do
      profile = Profile.new(last_name: 'Last', phone: '1234567890').save
      expect(profile).to eq(false)
    end
    
    it 'ensures last name presence' do
      profile = Profile.new(first_name: 'First', phone: '1234567890').save
      expect(profile).to eq(false)
    end
    
    it 'ensures email presence' do
      profile = Profile.new(first_name: 'First', last_name: 'Last').save
      expect(profile).to eq(false)
    end
  end
end
