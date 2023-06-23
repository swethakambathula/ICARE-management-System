class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :patient_records, dependent: :destroy
  has_many :user_patient_records, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :patient_records, through: :user_patient_records
end
