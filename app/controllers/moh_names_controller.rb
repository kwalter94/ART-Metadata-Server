class MohNamesController < ApplicationController
  def index
    @drugs = Drug.all_arvs.order(:name)
  end

  def edit
    @drug = Drug.find(params[:id])
    @moh_name = MohNamingService.find_drug_name(@drug)
  end

  def update
    name_params = params.require(:drug).permit(:name)

    @drug = Drug.find(params[:id])
    @moh_name = MohNamingService.create_or_update_drug_name(@drug, name_params[:name])
    @updated = @moh_name.errors.empty?

    render :edit
  end
end
