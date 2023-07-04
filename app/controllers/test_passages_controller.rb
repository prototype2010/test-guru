class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]
  after_action :set_end_time_cookie, only: %i[show update]

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      BadgeService.new(@test_passage).check_badges_available
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def show; end

  def result; end

  private

  def set_end_time_cookie
    cookies[:end_time] = @test_passage.end_time.to_time.iso8601
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
