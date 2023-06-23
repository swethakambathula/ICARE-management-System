ActiveAdmin.register Role do
  permit_params :name, :description

  filter :name

  index do
    column :name
    column :slug
    column :description
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    f.actions
  end

end