require 'rails_helper'
require 'spec_helper'
require 'factory_bot'

RSpec.describe "Users requests", type: :request do

  describe "Log in patient" do
    let(:user) { create(:patient) }
    before(:each) do
      sign_in user
    end

    it "Authorized patients will visit home page" do
      get root_path
      
      expect(response).to have_http_status(:success)
      expect(response.body).to include("We believe your family deserves better care now")
    end
  end

  describe "Log in doctor" do 
    let(:user) { create(:doctor) }
    before(:each) do
      sign_in user
    end   

    it "Authorized doctors will visit home page" do
      get root_path
      
      expect(response).to have_http_status(:success)
      expect(response.body).to_not include("New Appointment")
    end
  end
end
