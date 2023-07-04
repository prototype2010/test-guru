class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy show]

  def index
    @badges = Badge.all
  end

  def show; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit; end

  def new
    @badge = Badge.new
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    flash[:notice] = 'Deleted successfully'

    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :description, :url, :category_id, :circumstance, :level)
  end
end
