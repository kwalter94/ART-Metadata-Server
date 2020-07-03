# frozen_string_literal: true

class ConceptName < ApplicationRecord
  self.table_name = :concept_name
  self.primary_key = :concept_name_id

  belongs_to :concept
end
