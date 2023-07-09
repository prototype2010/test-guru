class BadgesController < ApplicationController
  def index
    @badges_received = current_user.badges.distinct
    @badges_not_received = Badge.where.not(id: @badges_received.pluck(:id))
  end
end
