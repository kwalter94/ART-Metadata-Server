# frozen_string_literal: true

class Concept < ApplicationRecord
  self.table_name = :concept
  self.primary_key = :concept_id

  has_many :concept_names
  has_many :concept_set 
  has_many :drugs
  has_many :concept_members, class_name: 'ConceptSet', foreign_key: :concept_set

  def self.find_all_by_name(concept_name)
    Concept.joins(:concept_names)
           .merge(ConceptName.where(name: concept_name, voided: false))
           .where(retired: false)
  end
end
