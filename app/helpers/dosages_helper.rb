module DosagesHelper
  MOH_WEIGHT_BANDS = [[3, 5.9],
                      [6, 9.9],
                      [10, 13.9],
                      [14, 19.9],
                      [20, 24.9],
                      [25, 29.9],
                      [30, 34.9],
                      [35, 39.9],
                      [40, 49.9],
                      [50, nil]].freeze

  def breakdown_to_moh_dosages(dosages)
    MOH_WEIGHT_BANDS.map do |weight_band|
      min_value, max_value = weight_band

      matching_dosage = dosages.find do |dosage|
        min_value >= dosage.min_weight\
          && (max_value && max_value <= dosage.max_weight)\
          || (max_value.nil? && min_value < dosage.max_weight)
      end

      next nil unless matching_dosage

      OpenStruct.new(am: matching_dosage.dose.am, pm: matching_dosage.dose.pm)
    end
  end
end
