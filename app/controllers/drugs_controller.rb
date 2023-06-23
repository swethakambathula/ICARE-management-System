class DrugsController < ApplicationController
  before_action :set_treatment
  before_action :set_treatment_drug, only: [:edit, :update, :destroy]

  def new
    @treatment_drug = TreatmentDrug.new
  end

  def create
    @treatment_drug = TreatmentDrug.new(drugs_params)
    @treatment_drug.treatment = @treatment

    if @treatment_drug.save
      redirect_to patient_record_treatment_path(@treatment_drug.treatment.patient_record, @treatment_drug.treatment), notice: "Drug added successfully."
    else
      redirect_to patient_record_treatment_path(@treatment_drug.treatment.patient_record, @treatment_drug.treatment), alert: @treatment_drug.errors.full_messages.join(",")
    end
  end

  def edit; end

  def update
    if @treatment_drug.update(drugs_params)
      redirect_to patient_record_treatment_path(@treatment_drug.treatment.patient_record, @treatment_drug.treatment), notice: "Drug updated successfully."
    else
      redirect_to patient_record_treatment_path(@treatment_drug.treatment.patient_record, @treatment_drug.treatment), alert: @treatment_drug.errors.full_messages.join(",")
    end
  end

  def destroy
    if @treatment_drug.destroy
      redirect_to patient_record_treatment_path(@treatment_drug.treatment.patient_record, @treatment_drug.treatment), notice: "Drug destroyed successfully."
    else
      redirect_to patient_record_treatment_path(@treatment_drug.treatment.patient_record, @treatment_drug.treatment), alert: @treatment_drug.errors.full_messages.join(",")
    end
  end

  private

  def drugs_params
    params.require(:treatment_drug).permit(:description, :drug_id)
  end

  def set_treatment_drug
    @treatment_drug = TreatmentDrug.find(params[:id])
  end

  def set_treatment
    @treatment = Treatment.find(params[:treatment_id])
  end
end
