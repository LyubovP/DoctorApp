require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  
  before(:each) do
    sign_in user
  end
  
  let(:user) { create(:patient) }
  let!(:profile) { create(:profile, user: user) } 
  let!(:appointment) { create(:appointment, patient: user, doctor: user) }

  describe "GET #index" do
    it "renders a successful response" do
      get appointments_url(appointment)
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    specify "has a 200 status code" do
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

  describe "GET #edit" do
    it "render a successful response" do
      get edit_appointment_url(appointment)
      expect(response).to be_successful
    end
  end

  it "shouldn't be orphaned by deleted doctor" do
    appointment.doctor.destroy
    expect(Appointment.exists?(appointment.id)).not_to be_truthy
  end

end
