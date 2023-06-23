class CreateTreatmentDrugs < ActiveRecord::Migration[7.0]
  def change
    create_table :treatment_drugs do |t|
      t.references :treatment, index: true
      t.references :drug, index: true
      t.text :description

      t.timestamps
    end
  end
end
