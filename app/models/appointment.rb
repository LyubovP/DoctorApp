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
class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, as: :recipient, dependent: :destroy 

  validates :message, presence: true, length: {maximum: 500}
end
