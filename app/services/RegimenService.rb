# frozen_string_literal: true

module RegimenService
  class << self
    def create_regimen(params)
      validate_regimen_doesnt_exist(params[:name])

      Regimen.transaction do
        regimen = Regimen.create!(params)
        RegimenIndex.find_or_create_by!(regimen_index: regimen.name[0], creator: 1)

        regimen
      end
    end

    private

    def validate_regimen_doesnt_exist(name)
      regimen_name = Regimen.find_by_name(name)

      return unless regimen_name

      raise ItemAlreadyExists, "Regimen #{name} already exists."
    end
  end
end
