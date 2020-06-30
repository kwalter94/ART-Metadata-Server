class RegimenCombination < ApplicationRecord
  self.table_name = :moh_regimen_combination
  self.primary_key = :regimen_combination_id

  belongs_to :regimen, foreign_key: :regimen_name_id

  has_many :drugs, class_name: 'RegimenCombinationDrug',
                   foreign_key: :regimen_combination_drug_id

  def name
    drugs.collect(&:name).join(' / ')
  end
end
