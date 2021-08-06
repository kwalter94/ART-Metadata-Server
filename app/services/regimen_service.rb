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
      raise ItemAlreadyExists, "Regimen #{name} already exists." if Regimen.where(name: name).exists?
    end
  end
end
