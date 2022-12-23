require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  before(:each) do
    sign_in user
  end
  
  let(:user) { create(:patient) }
  let!(:profile) { create(:profile, user: user) } 
  let!(:appointment) { create(:appointment, patient: user, doctor: user) }

  describe 'get :new' do
    specify 'has a 200 status code' do
      get new_appointment_path     
      expect(response.status).to eq (200)
    end
  end

  describe "GET #show" do
    it "renders :show" do
      get appointments_path

      expect(response).to have_http_status(:success)
    end
  end
  
end
