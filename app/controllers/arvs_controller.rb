# frozen_string_literal: true

class ArvsController < ApplicationController
  def index
    @arvs = DrugService.all_arvs
  end

  def show
    @arv = Drug.find(params[:id])
    @ingredients = RegimenIngredient.includes(:dose).where(drug: @arv)
    @regimens = Regimen.joins(:ingredients).merge(RegimenIngredient.where(drug: @arv))
  end

  def edit
    @arv = Drug.find(params[:id])
    @ingredients = RegimenIngredient.includes(:dose).where(drug: @arv)
    @regimens = Regimen.joins(:ingredients).merge(RegimenIngredient.where(drug: @arv))
  end
end
