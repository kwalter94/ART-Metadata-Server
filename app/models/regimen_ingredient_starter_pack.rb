# frozen_string_literal: true

class RegimenIngredientStarterPack < ApplicationRecord
  self.table_name = :moh_regimen_ingredient_starter_packs
  self.primary_key = :ingredient_id

  belongs_to :drug, foreign_key: :drug_inventory_id
  belongs_to :dose, class_name: 'RegimenDose', foreign_key: :dose_id
  belongs_to :regimen, class_name: 'Regimen', foreign_key: :regimen_id
end
