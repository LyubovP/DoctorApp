class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'
  belongs_to :user
  has_many :notifications, through: :user, dependent: :destroy  
end
