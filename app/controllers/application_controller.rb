class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
  end


  def after_sign_in_path_for(resource)
    if resource.class == User
      if resource.role.slug == "doctor"
        patient_records_path
      elsif resource.role.slug == "patient"
        patient_patient_records_path
      elsif resource.role.slug == "nurse"
        nurse_patient_records_path
      end
    else
      admin_root_path
    end
  end

  def check_doctor?
    redirect_to root_path, alert: "You are not authorized to perform this action." unless current_user.role.slug == "doctor"
  end
end
