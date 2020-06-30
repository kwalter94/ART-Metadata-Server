class Regimen < ApplicationRecord
  self.table_name = :moh_regimen_name
  self.primary_key = :regimen_name_id

  has_many :combinations, class_name: 'RegimenCombination'
end
