class AlternativeDrugName < ApplicationRecord
  belongs_to :drug, foreign_key: :drug_inventory_id
  
  validates_presence_of :name, :drug_inventory_id
end
