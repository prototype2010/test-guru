class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]
  after_action :set_end_time_cookie, only: %i[show update]


  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def show;end

  def result
    if @test_passage.passed? && !@test_passage.badge_given
      Badge.check_badges_available(@test_passage)
    end

    render :result
  end

  private

  def set_end_time_cookie
    cookies[:end_time] = @test_passage.end_time.to_time.iso8601
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
