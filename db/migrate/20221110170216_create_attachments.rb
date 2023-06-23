class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.references :patient_record, index: true

      t.timestamps
    end
  end
end
