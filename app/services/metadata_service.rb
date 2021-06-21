# frozen_string_literal: true

module MetadataService
  # These are the table we are concerned with in the database
  TARGET_TABLES = %w[concept concept_name concept_set concept_answer concept_class concept_datatype
                     concept_derived concept_description concept_map concept_name_tag concept_name_tag_map
                     concept_numeric concept_proposal concept_proposal_tag_map concept_set_derived concept_source
                     concept_state_conversion concept_synonym concept_word encounter_type patient_identifier_type
                     order_type person_attribute_type program program_workflow program_workflow_state
                     relationship_type drug privilege location role].freeze

  def self.dump_metadata
    db_config = Rails.application.config.database_configuration[Rails.env]
    database = db_config.fetch('database')
    username = db_config.fetch('username')
    password = db_config.fetch('password')
    host = db_config.fetch('host', 'localhost')
    port = db_config.fetch('port', '3306')

    tables = TARGET_TABLES.join(' ')

    `mysqldump --skip-column-statistics --user=#{username} --password=#{password} --host=#{host} --port=#{port} #{database} #{tables}`
  end
end
