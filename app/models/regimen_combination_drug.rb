class RegimenCombinationDrug < ApplicationRecord
  self.table_name = :moh_regimen_combination_drug
  self.primary_key = :regimen_combination_drug_id

  belongs_to :drug
  has_many :alternative_names, class_name: 'AlternativeDrugName',
                               foreign_key: :drug_id,
                               primary_key: :drug_inventory_id

  def name
    alternative_names.first&.name || drug.name
  end
end
