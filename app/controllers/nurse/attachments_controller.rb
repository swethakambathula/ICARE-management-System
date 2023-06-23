class Nurse::AttachmentsController < Nurse::ApplicationController
  before_action :set_patient_record
  before_action :set_attachment, only: [:update, :edit, :destroy]

  def new
    @attachment = @patient_record.attachments.new
  end

  def create
    @attachment = @patient_record.attachments.new(attachments_params)

    if @attachment.save
      pdf = WickedPdf.new.pdf_from_string(ActionController::Base.new().render_to_string(template: "attachments/attachment_pdf", layout: 'layouts/pdf', locals: {
        attachment: @attachment
      }))

      @attachment.file.attach(io: StringIO.new(pdf), filename: "file.pdf", content_type: "application/pdf")
      redirect_to nurse_my_patient_path(@patient_record), notice: "Attachment added successfully."
    else
      redirect_to nurse_my_patients_path, alert: @attachment.errors.full_messages.join(", ")
    end
  end

  def edit; end

  def update
    if @attachment.save
      pdf = WickedPdf.new.pdf_from_string(ActionController::Base.new().render_to_string(template: "attachments/attachment_pdf", layout: 'layouts/pdf', locals: {
        attachment: @attachment
      }))

      @attachment.file.attach(io: StringIO.new(pdf), filename: "file.pdf", content_type: "application/pdf")
      redirect_to nurse_my_patient_path(@patient_record), notice: "Attachment added successfully."
    else
      redirect_to nurse_my_patients_path, alert: @attachment.errors.full_messages.join(", ")
    end
  end

  def destroy
    @attachment = @patient_record.attachments.find(params[:id])

    if @attachment.destroy
      redirect_to nurse_my_patient_path(@patient_record), notice: "Attachment destroyed successfully."
    else
      redirect_to nurse_my_patients_path, alert: @attachment.errors.full_messages.join(", ")
    end
  end

  private

  def set_patient_record
    @patient_record = PatientRecord.find(params[:patient_record_id])
  end

  def set_attachment
    @attachment = @patient_record.attachments.find(params[:id])
  end

  def attachments_params
    params.require(:attachment).permit(:name, :address_1, :address_2, :city, :state, :country, :disease, :treatment, :image, drug_ids: [])
  end
end
