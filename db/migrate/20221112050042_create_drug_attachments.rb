class CreateDrugAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :drug_attachments do |t|
      t.references :drug, index: true
      t.references :attachment, index: true

      t.timestamps
    end
  end
end
