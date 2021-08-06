class RegimensController < ApplicationController
  REGIMEN_SORT_POSITION_LAST = 1_000_000 # Hopefully we will never have this many regimens

  def show
    @regimen = Regimen.find(params[:id])
  end

  def index
    @regimens = regimens.sort_by do |regimen|
      # All non-numeric regimens (eg Other) should be placed last
      regimen.name[0].match?(/\d/) ? regimen.name.to_i : REGIMEN_SORT_POSITION_LAST
    end
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

  def destroy
    @regimen = Regimen.find(params[:id])
    @regimen.destroy

    redirect_to regimens_path
  end

  private

  def regimens
    Regimen.all
  end

  def post_params
    params.require(:regimen).permit(:name)
  end
end
