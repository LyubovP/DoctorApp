class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, as: :recipient, dependent: :destroy 

  validates :message, presence: true, length: {maximum: 500}
end
