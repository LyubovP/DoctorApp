class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  
  accepts_nested_attributes_for :profile

  validates :email, presence: true

  enum role: {patient: 0, doctor: 1}

  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :patient
  end
end
