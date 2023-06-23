class Nurse::CommentsController < Nurse::ApplicationController
  before_action :set_patient_record
  before_action :set_comment, only: [:destroy, :update, :edit]

  def new
    @comment = @patient_record.comments.new
  end

  def create
    @comment = @patient_record.comments.new(comments_params)
    @comment.user = current_user

    if @comment.save
      redirect_to nurse_my_patient_path(@patient_record), notice: "Comment added successfully."
    else
      redirect_to nurse_my_patients_path, alert: @comment.errors.full_messages.join(", ")
    end
  end

  def edit; end

  def update
    if @comment.update(comments_params)
      redirect_to nurse_my_patient_path(@patient_record), notice: "Comment update successfully."
    else
      redirect_to nurse_my_patients_path, alert: @comment.errors.full_messages.join(", ")
    end
  end

  def destroy
    if @comment.destroy
      redirect_to nurse_my_patient_path(@patient_record), notice: "Comment destroyed successfully."
    else
      redirect_to nurse_my_patients_path, alert: @comment.errors.full_messages.join(", ")
    end
  end

  private

  def set_patient_record
    @patient_record = PatientRecord.find(params[:patient_record_id])
  end

  def set_comment
    @comment = @patient_record.comments.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:comment)
  end
end
