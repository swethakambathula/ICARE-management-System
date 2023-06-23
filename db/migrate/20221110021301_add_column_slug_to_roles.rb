class AddColumnSlugToRoles < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :slug, :string
  end
end
