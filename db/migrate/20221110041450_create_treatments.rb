class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.references :patient_record, index: true
      t.integer :doctor_id
      t.date :date
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
