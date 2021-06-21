# frozen_string_literal: true

class MetadataController < ApplicationController
  def show
    send_data MetadataService.dump_metadata, filename: 'openmrs_metadata_1_7.sql'
  end
end
