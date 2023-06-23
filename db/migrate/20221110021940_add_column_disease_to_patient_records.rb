class AddColumnDiseaseToPatientRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_records, :status, :integer, default: 0
    add_column :patient_records, :disease, :string
  end
end
