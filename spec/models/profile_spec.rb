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
