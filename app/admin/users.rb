ActiveAdmin.register User do
  permit_params :email, :name, :role_id, :address_1, :address_2, :city, :state, :country, :password, :password_confirmation

  filter :email

  form do |form|
    form.inputs do
      form.input :name
      form.input :email
      form.input :role_id, as: :select, collection: Role.all, prompt: "Select role"
      form.input :address_1
      form.input :address_2
      form.input :city
      form.input :state
      form.input :country
      if form.object.new_record?
        form.input :password, required: true
        form.input :password_confirmation, required: true
      end
    end
    form.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :role
      row :address_1
      row :address_2
      row :city
      row :state
      row :country
    end
  end

  index do
    selectable_column
    column :name
    column :email
    column :role
    column :address_1
    column :address_2
    column :city
    column :state
    column :country
    actions
  end
end