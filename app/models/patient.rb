class Patient < User    
  has_many :appointments, foreign_key: :patient_id, dependent: :destroy
end