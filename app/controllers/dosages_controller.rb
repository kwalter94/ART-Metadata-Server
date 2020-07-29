class DosagesController < ApplicationController
  def index
    @drug_dosages = drug_dosages
  end

  def edit
    @drug = Drug.find(params[:id])
    @dosages = RegimenIngredient.where(drug: @drug).sort_by do |ingredient|
      [ingredient.regimen.name, ingredient.min_weight]
    end
    @doses = RegimenDose.all
  end

  private

  def drug_dosages
    all_ingredients.each_with_object({}) do |dosage, dosages|
      dosages[dosage.drug] = [] unless dosages.include?(dosage.drug)

      next if dosages[dosage.drug].find { |d| d.min_weight == dosage.min_weight }

      dosages[dosage.drug] << dosage
    end
  end

  def all_ingredients
    RegimenIngredient.all
  end
end
