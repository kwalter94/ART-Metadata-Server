class MohRegimen < ApplicationRecord
  self.table_name =  'moh_regimens'
  self.primary_key = 'regimen_id'

  has_many :ingredients, class_name: 'MohRegimenIngredients'
  has_many :starter_pack_ingredients, class_name: 'MohRegimenIngredientStarterPacks'
end
