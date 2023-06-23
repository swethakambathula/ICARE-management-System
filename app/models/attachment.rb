require 'base64'
class Attachment < ApplicationRecord
  belongs_to :patient_record

  has_one_attached :file

  has_one_attached :image

  has_many :drug_attachments, dependent: :destroy
  has_many :drugs, through: :drug_attachments

  accepts_nested_attributes_for :drugs

  after_create :decrease_count

  def decrease_count
    self.drugs.each do |drug|
      drug.update_column(:stock, (drug.stock - 1))
    end
  end

  def wicked_blob_path
    path = ActiveStorage::Blob.service.send(:path_for, self.image.blob.key)
    Base64.encode64(File.open(path, "rb").read)
  end
end
