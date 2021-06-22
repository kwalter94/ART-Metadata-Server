# frozen_string_literal: true

class MetadataController < ApplicationController
  def openmrs
    send_data MetadataService.dump_openmrs_metadata, filename: 'openmrs_metadata_1_7.sql'
  end
  
  def moh
    send_data MetadataService.dump_moh_metadata, filename: 'moh_regimens_v2020.sql'
  end
end
