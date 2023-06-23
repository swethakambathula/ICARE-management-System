class Patient::PatientRecordsController < Patient::ApplicationController
  before_action :set_patient_record, only: [:update, :destroy, :show, :edit]

  def index
    @patient_records = PatientRecord.all
  end

  def new
    @patient_record = PatientRecord.new
  end

  def create
    @patient_record = PatientRecord.new(patient_records_params)
    @patient_record.user = current_user

    if @patient_record.save
      redirect_to patient_patient_records_path, notice: "Patient record created successfully."
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @patient_record.update(patient_records_params)
      redirect_to patient_patient_records_path, notice: "Patient record updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @patient_record.destroy
      redirect_to patient_patient_records_path, notice: "Patient record destroyed successfully."
    else
      redirect_to patient_patient_records_path, alert: @patient_record.errors.full_messages.join(",")
    end
  end

  private

  def set_patient_record
    @patient_record = PatientRecord.find(params[:id])
  end

  def patient_records_params
    params.require(:patient_record).permit(:date_of_birth, :height, :weight, :bed_id, :blood_group, :treatment_area,
                                           :treatment_city, :treatment_state, :treatment_country, :disease, :status)
  end
end