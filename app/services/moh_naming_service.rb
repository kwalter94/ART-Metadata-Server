# frozen_string_literal: true

module MohNamingService
  class << self
    def create_or_update_drug_name(drug, name)
      moh_name = find_drug_name(drug)

      if moh_name
        moh_name.update(name: name)
      else
        moh_name = create_drug_name(drug, name)
      end

      moh_name
    end

    def find_drug_name(drug)
      drug.alternative_names.first
    end

    def create_drug_name(drug, name)
      AlternativeDrugName.create(drug: drug, name: name)
    end
  end
end
