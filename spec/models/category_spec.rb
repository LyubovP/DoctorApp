require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:categories_users) }
  it { should have_many(:users).through(:categories_users) }
end
