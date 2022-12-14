class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :categories_users
  has_many :users, through: :categories_users
  has_many :categories, through: :categories_users
  
  accepts_nested_attributes_for :profile

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6},
    allow_nil: true

  enum role: {patient: 0, doctor: 1}

  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :patient
  end
end
