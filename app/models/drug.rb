class Drug < ApplicationRecord

  has_many :treatment_drugs, dependent: :destroy
  has_many :treatments, dependent: :destroy

  has_many :drug_attachments, dependent: :destroy
  has_many :attachments, through: :drug_attachments
end
