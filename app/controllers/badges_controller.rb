class BadgesController < ApplicationController
  def index
    @badges_received = current_user.badges.distinct
    @badges_not_received = Badge.all - @badges_received
  end
end
