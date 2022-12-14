module UserRole
  PATIENT = "patient".freeze
  DOCTOR = "doctor".freeze

  def self.patient_role
    [UserRole::PATIENT]
  end

  def self.doctor_role
    [UserRoles::DOCTOR]
  end
end
