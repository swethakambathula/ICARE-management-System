class Patient::TreatmentsController < Patient::ApplicationController
  def show
    @treatment = Treatment.find(params[:id])
  end
end