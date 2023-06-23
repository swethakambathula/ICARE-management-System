class UserPatientRecord < ApplicationRecord
  belongs_to :user
  belongs_to :patient_record
end
