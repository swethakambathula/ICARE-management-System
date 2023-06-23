class AddColumnDiseaseToAttachments < ActiveRecord::Migration[7.0]
  def change
    add_column :attachments, :address_1, :string
    add_column :attachments, :address_2, :string
    add_column :attachments, :city, :string
    add_column :attachments, :state, :string
    add_column :attachments, :country, :string
    add_column :attachments, :disease, :string
    add_column :attachments, :treatment, :text
  end
end
