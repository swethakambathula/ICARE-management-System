class CreatePatientRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :patient_records do |t|
      t.references :user, index: true
      t.date :date_of_birth
      t.integer :height
      t.integer :weight
      t.string :bed_id
      t.string :blood_group
      t.string :treatment_area
      t.string :treatment_city
      t.string :treatment_state
      t.string :treatment_country

      t.timestamps
    end
  end
end
