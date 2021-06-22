# frozen_string_literal: true

module MetadataService
  def self.dump_openmrs_metadata
    dump_tables %w[concept concept_name concept_set concept_answer concept_class concept_datatype
                   concept_derived concept_description concept_map concept_name_tag concept_name_tag_map
                   concept_numeric concept_proposal concept_proposal_tag_map concept_set_derived concept_source
                   concept_state_conversion concept_synonym concept_word encounter_type patient_identifier_type
                   order_type person_attribute_type program program_workflow program_workflow_state
                   relationship_type drug privilege location role]
  end

  def self.dump_moh_metadata
    dump_tables %w[moh_regimens moh_regimen_doses moh_regimen_ingredient moh_regimen_ingredient_starter_packs
                   moh_regimen_lookup moh_regimen_ingredient_tb_treatment alternative_drug_names
                   moh_regimen_combination moh_regimen_combination_drug moh_regimen_name]
  end

  def self.dump_tables(tables)
    db_config = Rails.application.config.database_configuration[Rails.env]
    database = db_config.fetch('database')
    username = db_config.fetch('username')
    password = db_config.fetch('password')
    host = db_config.fetch('host', 'localhost')
    port = db_config.fetch('port', '3306')

    `mysqldump --skip-column-statistics --user=#{username} --password=#{password} --host=#{host} --port=#{port} #{database} #{tables.join(' ')}`
  end
end
