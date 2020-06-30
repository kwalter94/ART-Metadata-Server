class RegimenDose < ApplicationRecord
  self.table_name = 'moh_regimen_doses'
  self.primary_key = 'dose_id'

  has_many :ingredients, class_name: 'RegimenIngredient',
                         foreign_key: :dose_id
end
