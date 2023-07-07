module BadgesHelper
  def form_badge_header(badge)
    "#{badge.persisted? ? 'Edit' : 'Create new'} badge"
  end

  def print_badge_rules(badge)
    badge.rules
         .map(&:description)
         .join(', ')
  end
end
