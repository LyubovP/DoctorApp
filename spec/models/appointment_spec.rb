# == Schema Information
#
# Table name: appointments
#
#  id         :bigint           not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  doctor_id  :bigint
#  patient_id :bigint
#
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to(:patient).class_name('User') }
  it { is_expected.to belong_to(:doctor).class_name('User') }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:notifications).dependent(:destroy) }
  it { is_expected.to validate_presence_of :message }
  it { is_expected.to validate_length_of(:message).is_at_most(500) }
end
