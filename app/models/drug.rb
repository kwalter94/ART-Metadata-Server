class Drug < ApplicationRecord
  self.table_name = :drug
  self.primary_key = :drug_id

  belongs_to :concept
  has_many :alternative_names, class_name: 'AlternativeDrugName', foreign_key: 'drug_inventory_id'

  scope(:all_arvs, lambda do
    arvs_concept = Concept.find_all_by_name('Antiretroviral Drugs')
    arv_drugs_concepts = ConceptSet.where(set: arvs_concept)

    where(concept: arv_drugs_concepts, retired: false).includes(:alternative_names)
  end)

  def moh_name
    @moh_name ||= (alternative_names.first&.name || name)
  end
end
