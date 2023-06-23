class GeneralDrugsController < ApplicationController

  def index
    @general_drugs = Drug.all
  end
end
