class Nurse::GeneralDrugsController < Nurse::ApplicationController

  def index
    @general_drugs = Drug.all
  end
end
