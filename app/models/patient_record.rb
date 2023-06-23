class PatientRecord < ApplicationRecord
  belongs_to :user

  enum status: [:not_started, :in_progress, :cured]

  has_many :user_patient_records, dependent: :destroy
  has_many :users, through: :user_patient_records
  has_many :comments, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :attachments, dependent: :destroy
end
