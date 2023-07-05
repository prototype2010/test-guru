module BadgesHelper
  def form_badge_header(badge)
    "#{badge.persisted? ? 'Edit' : 'Create new'} badge"
  end

  def level_select_options
    Test.all.order(:level).distinct(:level).pluck(:level)
  end
end
