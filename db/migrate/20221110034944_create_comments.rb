class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :patient_record, index: true
      t.text :comment
      t.datetime :added_at

      t.timestamps
    end
  end
end
