# ActiveAdmin.register PatientRecord do
#   permit_params :user_id, :date_of_birth, :height, :weight, :blood_group, :bed_id, :treatment_city, :treatment_area, :treatment_country,
#                 :disease, :treatment_state
#
#   filter :disease
#   filter :bed_id
#
#   form do |form|
#     form.inputs do
#       form.input :user_id, as: :select, collection: User.where(role_id: Role.find_by_slug("patient").id).all, prompt: "Select user"
#       form.input :date_of_birth
#       form.input :height
#       form.input :weight
#       form.input :blood_group
#       form.input :bed_id
#       form.input :treatment_area
#       form.input :treatment_city
#       form.input :treatment_state
#       form.input :treatment_country
#       form.input :disease
#     end
#     form.actions
#   end
# end