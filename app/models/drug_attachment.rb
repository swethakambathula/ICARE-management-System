class DrugAttachment < ApplicationRecord
  belongs_to :drug
  belongs_to :attachment
end
