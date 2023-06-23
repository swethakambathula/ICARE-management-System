class Patient::ApplicationController < ApplicationController
  before_action :check_patient?

  def check_patient?
    redirect_to root_path, alert: "You are not authorized to perform this action."   unless current_user.role.slug == "patient"
  end
end