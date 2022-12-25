# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  type                   :string           default("Patient")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
