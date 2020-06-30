class Drug < ApplicationRecord
  self.table_name = :drug
  self.primary_key = :drug_id
  
  has_many :alternative_names, class_name: 'AlternativeDrugName', foreign_key: 'drug_inventory_id'
end
