class RegimenCombinationsController < ApplicationController
  def destroy
    combination = RegimenCombination.find(params[:id])
    combination.destroy

    redirect_to edit_regimen_path(combination.regimen)
  end
end
