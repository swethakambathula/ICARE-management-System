class CreateUserPatientRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :user_patient_records do |t|
      t.references :user, index: true
      t.references :patient_record, index: true

      t.timestamps
    end
  end
end
