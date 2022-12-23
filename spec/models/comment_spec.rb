require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:appointment) }
  it { should belong_to(:user) }
  it { should have_rich_text(:body) }
end
