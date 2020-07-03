class Regimen < ApplicationRecord
  self.table_name = :moh_regimen_name
  self.primary_key = :regimen_name_id

  has_many :combinations, class_name: 'RegimenCombination',
                          foreign_key: :regimen_name_id

  accepts_nested_attributes_for :combinations, allow_destroy: true
end
