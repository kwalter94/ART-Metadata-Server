class MohRegimenName < ApplicationRecord
  self.primary_key = :regimen_name_id

  has_many :regimen_combination, class: 'MohRegimenCombination'
end
