class TreatmentDrug < ApplicationRecord
  belongs_to :drug
  belongs_to :treatment
end
