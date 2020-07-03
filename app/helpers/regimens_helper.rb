module RegimensHelper
  def arvs
    Drug.all_arvs
        .sort_by(&:moh_name)
        .map { |arv| [arv.moh_name, arv.id] }
  end
end
