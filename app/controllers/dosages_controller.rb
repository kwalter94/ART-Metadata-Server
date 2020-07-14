class DosagesController < ApplicationController
  def index
    @drug_dosages = drug_dosages
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
