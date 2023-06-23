class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :patient_record

  before_create :set_date

  def set_date
    self.added_at = DateTime.current
  end
end
