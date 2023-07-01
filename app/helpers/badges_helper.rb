module BadgesHelper
  def form_badge_header(badge)
    "#{badge.persisted? ? 'Edit' : 'Create new'} badge"
  end

  def circumstance_select_options
    Badge.circumstance_variants.map do |circumstance|
      [from_snake_to_readable(circumstance.first), circumstance.first]
    end
  end

  def from_snake_to_readable(circumstance)
    circumstance.gsub('_',' ')
  end

  def from_index_to_readable(circumstance_index)
    from_snake_to_readable(
      Badge.circumstance_variants.key(circumstance_index.to_i)
    )
  end
end
