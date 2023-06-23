class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if current_user.present?
      if current_user.role.slug == "doctor"
        redirect_to patient_records_path
      elsif current_user.role.slug == "patient"
        redirect_to patient_patient_records_path
      elsif current_user.role.slug == "nurse"
        redirect_to  nurse_patient_records_path
      end
    end
  end
end
