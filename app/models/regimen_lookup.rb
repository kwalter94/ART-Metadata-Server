# frozen_string_literal: true

class RegimenLookup < ApplicationRecord
  self.table_name = 'moh_regimen_lookup'
  self.primary_key = 'regimen_lookup_id'
end
