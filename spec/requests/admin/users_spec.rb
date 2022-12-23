require 'rails_helper'

RSpec.describe "Admin::Users", type: :request do
  let(:user) { AdminUser.create!(email: 'admin@example.com', password: 'password') }

  before(:each) do
    sign_in user
  end

  describe 'edit' do
    it 'renders user form' do
      get "/admin/admin_users/#{user.id}/edit"
      expect(assigns(:admin_user)).to eq user
    end
  end

  describe 'update' do
    it 'updates user' do
      patch "/admin/admin_users/#{user.id}", params: { id: user, user: { email: 'admin@example.com', password: '' } }
      user.reload
      expect(user.email).to eq 'admin@example.com'
    end
  end
end
