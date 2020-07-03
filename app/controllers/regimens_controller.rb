class RegimensController < ApplicationController
  def index
    @regimens = regimens.order(:name)
  end

  def new
    @regimen = Regimen.new
  end

  def create
    @regimen = RegimenService.create_regimen(post_params)

    if @regimen.errors.empty?
      redirect_to regimen_path(@regimen)
    else
      render :new
    end
  end

  def edit
    @regimen = Regimen.find(params[:id])
    @arvs = Drug.all_arvs
  end

  def update
    @regimen = Regimen.find(params[:id])

    if @regimen.update(params.require(:regimen).permit!)
      redirect_to edit_regimen_path(@regimen)
    else
      render :edit
    end
  end

  private

  def regimens
    Regimen.all
  end

  def post_params
    params.require(:regimen).permit(:name)
  end
end
