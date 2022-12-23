require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:profile) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:notifications).dependent(:destroy) }
  it { should have_many(:categories_users) }
  it { should have_many(:users).through(:categories_users) }
  it { should have_many(:categories).through(:categories_users) }
  it { should accept_nested_attributes_for(:profile) }
  it { is_expected.to validate_presence_of :email }
  
  context 'validation tests' do
    it 'wrong email' do
      user = Patient.new(email: 'sample@@example.com').save
      expect(user).to eq(false)
    end
    
    it 'wrong email' do
      user = Patient.new(email: 'sample@examplecom').save
      expect(user).to eq(false)
    end
    
    it 'mising email' do
      user = Patient.new().save
      expect(user).to eq(false)
    end
  end
end
