module RulesHelper
  def circumstance_to_readable(circumstance)
    circumstance.gsub('_',' ').capitalize
  end
end
