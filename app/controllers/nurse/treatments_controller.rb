class Nurse::TreatmentsController < Nurse::ApplicationController
  before_action :set_patient_record
  before_action :set_treatment, only: [:show, :destroy, :update, :edit]

  def new
    @treatment = @patient_record.treatments.new
  end

  def create
    @treatment = @patient_record.treatments.new(treatments_params)
    @treatment.doctor = current_user

    if @treatment.save
      redirect_to nurse_my_patient_path(@patient_record), notice: "Treatment added successfully."
    else
      redirect_to nurse_my_patients_path, alert: @treatment.errors.full_messages.join(", ")
    end
  end

  def show; end

  def edit; end

  def update
    if @treatment.update(treatments_params)
      redirect_to nurse_my_patient_path(@patient_record), notice: "Treatment updated successfully."
    else
      redirect_to nurse_my_patients_path, alert: @treatment.errors.full_messages.join(", ")
    end
  end

  def destroy
    if @treatment.destroy
      redirect_to nurse_my_patient_path(@patient_record), notice: "Treatment destroyed successfully."
    else
      redirect_to nurse_my_patients_path, alert: @treatment.errors.full_messages.join(", ")
    end
  end

  private

  def treatments_params
    params.require(:treatment).permit(:description, :status)
  end

  def set_treatment
    @treatment = @patient_record.treatments.find(params[:id])
  end

  def set_patient_record
    @patient_record = PatientRecord.find(params[:patient_record_id])
  end
end