class Nurse::MyPatientsController < Nurse::ApplicationController

  def index
    @patient_records = PatientRecord.includes(:user_patient_records).where(user_patient_records: { user_id: current_user.id}).all
  end

  def show
    @patient_record = PatientRecord.find(params[:id])
  end
end