class AddColumnNameToPatientRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :patient_records, :name, :string
  end
end
