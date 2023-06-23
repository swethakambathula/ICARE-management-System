class Treatment < ApplicationRecord
  belongs_to :patient_record
  belongs_to :doctor, class_name: "User", foreign_key: :doctor_id

  has_many :treatment_drugs, dependent: :destroy
  has_many :drugs, through: :treatment_drugs

  enum status: [:in_progress, :completed]

  validates_presence_of :description

  before_create :set_date

  def set_date
    self.date = Date.current
  end
end
